From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Oct 2021 16:26:08 +0200
Subject: [PATCH v2 16/43] KVM: Don't redo ktime_get() when calculating
 halt-polling stop/deadline
In-Reply-To: <20211009021236.4122790-17-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-17-seanjc@google.com>
Message-ID: <0072221e-02e8-4d60-9b0f-80d8c423bf4e@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/10/21 04:12, Sean Christopherson wrote:
> Calculate the halt-polling "stop" time using "cur" instead of redoing
> ktime_get().  In the happy case where hardware correctly predicts
> do_halt_poll, "cur" is only a few cycles old.  And if the branch is
> mispredicted, arguably that extra latency should count toward the
> halt-polling time.
> 
> In all likelihood, the numbers involved are in the noise and either
> approach is perfectly ok.

Using "start" makes the change even more obvious, so:

     Calculate the halt-polling "stop" time using "start" instead of redoing
     ktime_get().  In practice, the numbers involved are in the noise (e.g.,
     in the happy case where hardware correctly predicts do_halt_poll and
     there are no interrupts, "start" is probably only a few cycles old)
     and either approach is perfectly ok.  But it's more precise to count
     any extra latency toward the halt-polling time.

Paolo


