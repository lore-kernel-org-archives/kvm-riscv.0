From: Sean Christopherson <seanjc@google.com>
Date: Wed, 27 Oct 2021 14:41:29 +0000
Subject: [PATCH v2 00/43] KVM: Halt-polling and x86 APICv overhaul
In-Reply-To: <614858dd-106c-64cc-04bc-f1887b2054d1@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <614858dd-106c-64cc-04bc-f1887b2054d1@redhat.com>
Message-ID: <YXllGfrjPX1pVUx6@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> On 09/10/21 04:11, Sean Christopherson wrote:
> Queued 1-20 and 22-28.  Initially I skipped 21 because I didn't receive it,
> but I have to think more about whether I agree with it.

https://lkml.kernel.org/r/20211009021236.4122790-22-seanjc at google.com

> In reality the CMPXCHG loops can really fail just once, because they only
> race with the processor setting ON=1.  But if the warnings were to trigger
> at all, it would mean that something iffy is happening in the
> pi_desc->control state machine, and having the check on every iteration is
> (very marginally) more effective.

Yeah, the "very marginally" caveat is essentially my argument.  The WARNs are
really there to ensure that the vCPU itself did the correct setup/clean before
and after blocking.  Because IRQs are disabled, a failure on iteration>0 but not
iteration=0 would mean that a different CPU or a device modified the PI descriptor.
If that happens, (a) something is wildly wrong and (b) as you noted, the odds of
the WARN firing in the tiny window between iteration=0 and iteration=1 are really,
really low.

The other thing I don't like about having the WARN in the loop is that it suggests
that something other than the vCPU can modify the NDST and SN fields, which is
wrong and confusing (for me).  The WARNs in the loops made more sense when the
loops ran with IRQs enabled prior to commit 8b306e2f3c41 ("KVM: VMX: avoid
double list add with VT-d posted interrupts").  Then it would be at least plausible
that a vCPU could mess up its own descriptor while being scheduled out/in.

