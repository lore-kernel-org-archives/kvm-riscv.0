From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 22 Apr 2023 01:46:58 +0200
Subject: [GIT PULL] KVM/riscv changes for 6.4
In-Reply-To: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
References: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
Message-ID: <CABgObfbS7ej9pqmV05DKwq1929QD10EQ9XdkEb_Qhtbm1WrkeQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 21, 2023 at 7:34?PM Anup Patel <anup@brainfault.org> wrote:
> Please note that the Zicboz series has been taken by
> Palmer through the RISC-V tree which results in few
> minor conflicts in the following files:
> arch/riscv/include/asm/hwcap.h
> arch/riscv/include/uapi/asm/kvm.h
> arch/riscv/kernel/cpu.c
> arch/riscv/kernel/cpufeature.c
> arch/riscv/kvm/vcpu.c
>
> I am not sure if a shared tag can make things easy for you or Palmer.

It's not just making it easier, it is a requirement because I prefer
to keep an eye on changes to uapi.h and especially to avoid that
conflicts in KVM files reach Linus.

The conflicts may be minor, but they are a symptom of overlooking
"something" in the workflow.

If I can get the shared tag from Palmer then good, otherwise I suppose
this PR will also have to be delayed to the second week of the merge
window.

Paolo


