/**
 * One-trigger-per-object dispatcher.
 * MIGRATION: evaluate handler methods independently; do not convert the trigger shell.
 */
trigger TaskTrigger on Task (
    before insert, after insert, before update, after update, before delete, after delete, after undelete
) {
    new TaskTriggerHandler().run(
        Trigger.isBefore,
        Trigger.isAfter,
        Trigger.isInsert,
        Trigger.isUpdate,
        Trigger.isDelete,
        Trigger.isUndelete,
        Trigger.new,
        Trigger.oldMap
    );
}
