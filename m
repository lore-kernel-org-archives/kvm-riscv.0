From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 22 Sep 2023 23:27:54 +0200
Subject: [GIT PULL] KVM/riscv fixes for 6.6, take #1
In-Reply-To: <CAAhSdy3dL1JBSsu3yrQtJKavAkqMva=YotoV_y_+-kt0S0oVNA@mail.gmail.com>
References: <CAAhSdy3dL1JBSsu3yrQtJKavAkqMva=YotoV_y_+-kt0S0oVNA@mail.gmail.com>
Message-ID: <CABgObfa48fkRqyaG0DWB7bkq435zeN3R0NjoY9_JP0BJ+AQCBw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 21, 2023 at 11:44?AM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have four ONE_REG related fixes for 6.6. Out of these,
> two are for kernel KVM module and other two are for get-reg-list
> selftest.
>
> Please pull.
>
> Regards,
> Anup
>
> The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:
>
>   Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.6-1
>
> for you to fetch changes up to 071ef070ca77e6dfe33fd78afa293e83422f0411:
>
>   KVM: riscv: selftests: Selectively filter-out AIA registers

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> KVM/riscv fixes for 6.6, take #1
>
> - Fix KVM_GET_REG_LIST API for ISA_EXT registers
> - Fix reading ISA_EXT register of a missing extension
> - Fix ISA_EXT register handling in get-reg-list test
> - Fix filtering of AIA registers in get-reg-list test
>
> ----------------------------------------------------------------
> Anup Patel (4):
>       RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT registers
>       RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for missing extensions
>       KVM: riscv: selftests: Fix ISA_EXT register handling in get-reg-list
>       KVM: riscv: selftests: Selectively filter-out AIA registers
>
>  arch/riscv/kvm/vcpu_onereg.c                     |  7 ++-
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 58 +++++++++++++++++-------
>  2 files changed, 47 insertions(+), 18 deletions(-)
>


