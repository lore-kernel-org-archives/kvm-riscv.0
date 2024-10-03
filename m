From: Richard Henderson <richard.henderson@linaro.org>
Date: Thu, 3 Oct 2024 11:40:12 -0700
Subject: [PATCH v2 1/1] target/riscv: enable floating point unit
In-Reply-To: <20240925061704.12440-1-heinrich.schuchardt@canonical.com>
References: <20240925061704.12440-1-heinrich.schuchardt@canonical.com>
Message-ID: <ec6ed202-f67c-402a-9abc-19c31f03ec8d@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/24/24 23:17, Heinrich Schuchardt wrote:
> The status and mstatus CSRs contain bit field FS, which control if the
> floating point unit of RISC-V hart is enabled.
> 
> There seems to be no specification prescribing the value of the field when
> entering S-mode from M-mode. But OpenSBI, as the leading SBI M-mode
> firmware, has set a precedent by enabling the FPU by setting the value of
> FS to 3 (dirty).
> 
> In TCG mode, QEMU uses OpenSBI by default. Users can reasonably expect that
> software running QEMU in TCG mode and in KVM mode behaves similarly.
> 
> When QEMU in KVM mode creates a vCPU, Linux' KVM code sets FS=1 (initial)
> in kvm_riscv_vcpu_fp_reset(). However, QEMU internally keeps a value of
> FS=0 (off) and then synchronizes this value into KVM. Thus VS-mode software
> is invoked with a disabled floating point unit.

This suggests that qemu is incorrectly syncing the registers from kvm at vcpu startup.

> +    if (riscv_has_ext(env, RVF) || riscv_has_ext(env, RVD)) {
> +        env->mstatus = set_field(env->mstatus, MSTATUS_FS, env->misa_mxl);

Storing misa_mxl here is wrong.  That's '1' for rv32 and '2' for rv64.
You want a single constant value, either '1' (initial) or '2' (clean).
 From the kvm source, initial seems preferable.


r~

