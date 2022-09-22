From: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date: Thu, 22 Sep 2022 15:17:56 +0200
Subject: [PATCH v4 11/12] KVM: mips, x86: do not rely on KVM_REQ_UNHALT
In-Reply-To: <20220921003201.1441511-12-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com> <20220921003201.1441511-12-seanjc@google.com>
Message-ID: <CAAdtpL4yFdh3V0Be05OKxUFBTSgFs6oTy9U5FjSRGwOhi=tDMQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 21, 2022 at 2:34 AM Sean Christopherson <seanjc@google.com> wrote:
>
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> KVM_REQ_UNHALT is a weird request that simply reports the value of
> kvm_arch_vcpu_runnable() on exit from kvm_vcpu_halt().  Only
> MIPS and x86 are looking at it, the others just clear it.  Check
> the state of the vCPU directly so that the request is handled
> as a nop on all architectures.
>
> No functional change intended, except for corner cases where an
> event arrive immediately after a signal become pending or after
> another similar host-side event.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/mips/kvm/emulate.c | 7 +++----
>  arch/x86/kvm/x86.c      | 9 ++++++++-
>  2 files changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daud? <f4bug@amsat.org>

