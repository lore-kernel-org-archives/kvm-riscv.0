From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Mon, 01 Nov 2021 00:19:31 +0200
Subject: [PATCH v2 40/43] KVM: VMX: Wake vCPU when delivering posted IRQ
 even if vCPU == this vCPU
In-Reply-To: <YXlwmrrRVIoaU2kG@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-41-seanjc@google.com>
 <a2a4e076-edb8-2cb5-5cb2-6825a1a4559a@redhat.com>
 <YXlwmrrRVIoaU2kG@google.com>
Message-ID: <1f2fb5f18b0f0bcee71c9d506769dd1357273444.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-10-27 at 15:30 +0000, Sean Christopherson wrote:
> On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> > On 09/10/21 04:12, Sean Christopherson wrote:
> > > Lastly, this aligns the non-nested and nested usage of triggering posted
> > > interrupts, and will allow for additional cleanups.
> > 
> > It also aligns with SVM a little bit more (especially given patch 35),
> > doesn't it?
> 
> Yes, aligning VMX and SVM APICv behavior as much as possible is definitely a goal
> of this series, though I suspect I failed to state that anywhere.
> 

Looks reasonable to me.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitky


