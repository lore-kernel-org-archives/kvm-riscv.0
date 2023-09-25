From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Sep 2023 18:58:55 +0530
Subject: [PATCH 0/2] RISC-V: KVM: A couple kselftests improvements
In-Reply-To: <20230817162344.17076-4-ajones@ventanamicro.com>
References: <20230817162344.17076-4-ajones@ventanamicro.com>
Message-ID: <CAAhSdy1DFpHWGo23zWksvQKJgsqsZ479uOHL9VRt3o1e_d=kEw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 17, 2023 at 9:53?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Add the riscv kselftests test dir to MAINTAINERS and improve the
> maintainability of the arrays in the get-reg-list test.
>
> These tests are based on kvm-riscv/riscv_kvm_queue.
>
> Andrew Jones (2):
>   MAINTAINERS: RISC-V: KVM: Add another kselftests path
>   KVM: selftests: Add array order helpers to riscv get-reg-list

Queued this series for Linux-6.7

Thanks,
Anup

>
>  MAINTAINERS                                   |  1 +
>  .../selftests/kvm/riscv/get-reg-list.c        | 76 ++++++++++---------
>  2 files changed, 42 insertions(+), 35 deletions(-)
>
> --
> 2.41.0
>

