From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Wed, 27 Oct 2021 17:35:45 +0300
Subject: [PATCH v2 16/43] KVM: Don't redo ktime_get() when calculating
 halt-polling stop/deadline
In-Reply-To: <0072221e-02e8-4d60-9b0f-80d8c423bf4e@redhat.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-17-seanjc@google.com>
 <0072221e-02e8-4d60-9b0f-80d8c423bf4e@redhat.com>
Message-ID: <3a0c3397302d59ea313e079435a18bf1b9a43474.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-10-25 at 16:26 +0200, Paolo Bonzini wrote:
> On 09/10/21 04:12, Sean Christopherson wrote:
> > Calculate the halt-polling "stop" time using "cur" instead of redoing
> > ktime_get().  In the happy case where hardware correctly predicts
> > do_halt_poll, "cur" is only a few cycles old.  And if the branch is
> > mispredicted, arguably that extra latency should count toward the
> > halt-polling time.
> > 
> > In all likelihood, the numbers involved are in the noise and either
> > approach is perfectly ok.
> 
> Using "start" makes the change even more obvious, so:
> 
>      Calculate the halt-polling "stop" time using "start" instead of redoing
>      ktime_get().  In practice, the numbers involved are in the noise (e.g.,
>      in the happy case where hardware correctly predicts do_halt_poll and
>      there are no interrupts, "start" is probably only a few cycles old)
>      and either approach is perfectly ok.  But it's more precise to count
>      any extra latency toward the halt-polling time.
> 
> Paolo
> 
Agreed.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>



