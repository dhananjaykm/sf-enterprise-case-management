import { LightningElement, api, track } from 'lwc';

/**
 * Documents the intended LWC → Screen Flow launch path.
 * This legacy org does not deploy Flow metadata. The method fails closed.
 *
 * MIGRATION: F — replace with lightning-flow once Case_Screen_Candidate exists.
 */
export default class SurveyLauncher extends LightningElement {
    @api recordId;
    @track error;
    @track rows = [];
    columns = [
        { label: 'Step', fieldName: 'name', type: 'text' },
        { label: 'Status', fieldName: 'status', type: 'text' }
    ];

    handleRefresh() {
        this.rows = [
            { id: '1', name: 'Select records', status: 'Ready' },
            { id: '2', name: 'Confirm', status: 'Blocked — Flow not deployed' }
        ];
    }

    handleApply() {
        this.error = 'Flow Case_Screen_Candidate is not deployed in this legacy pro-code org.';
    }

    handleRowAction() {
        this.handleApply();
    }

    connectedCallback() {
        this.handleRefresh();
    }
}
