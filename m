From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Mon, 01 Nov 2021 00:33:40 +0200
Subject: [PATCH v2 43/43] KVM: VMX: Don't do full kick when handling
 posted interrupt wakeup
In-Reply-To: <01b5edae-aaa9-e96d-daaa-197c0c3a0431@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-44-seanjc@google.com>
 <01b5edae-aaa9-e96d-daaa-197c0c3a0431@redhat.com>
Message-ID: <c4453a4bd13dc8120664fe0bf4db5e391d4748e2.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-10-25 at 16:16 +0200, Paolo Bonzini wrote:
> On 09/10/21 04:12, Sean Christopherson wrote:
> > When waking vCPUs in the posted interrupt wakeup handling, do exactly
> > that and no more.  There is no need to kick the vCPU as the wakeup
> > handler just need to get the vCPU task running, and if it's in the guest
> > then it's definitely running.
> 
> And more important, the transition from blocking to running will have 
> gone through sync_pir_to_irr, thus checking ON and manually moving the 
> vector from PIR to RVI.
> 
> Paolo
> 
I also think so, and maybe this can be added to the commit message.

Anyway, last one for the series :)

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>



Best regards,
	Maxim Levitsky


