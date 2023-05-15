From: Björn Töpel <bjorn@kernel.org>
Date: Mon, 15 May 2023 13:41:13 +0200
Subject: [PATCH -next v19 24/24] riscv: Add documentation for Vector
In-Reply-To: <20230509103033.11285-25-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-25-andy.chiu@sifive.com>
Message-ID: <87r0rhhleu.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> This patch add a brief documentation of the userspace interface in
> regard to the RISC-V Vector extension.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  Documentation/riscv/index.rst  |   1 +
>  Documentation/riscv/vector.rst | 128 +++++++++++++++++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 Documentation/riscv/vector.rst
>
> diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
> index 175a91db0200..95cf9c1e1da1 100644
> --- a/Documentation/riscv/index.rst
> +++ b/Documentation/riscv/index.rst
> @@ -10,6 +10,7 @@ RISC-V architecture
>      hwprobe
>      patch-acceptance
>      uabi
> +    vector
>  
>      features
>  
> diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.rst
> new file mode 100644
> index 000000000000..d4d626721921
> --- /dev/null
> +++ b/Documentation/riscv/vector.rst
> @@ -0,0 +1,128 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +=========================================
> +Vector Extension Support for RISC-V Linux
> +=========================================
> +
> +This document briefly outlines the interface provided to userspace by Linux in
> +order to support the use of the RISC-V Vector Extension.
> +
> +1.  prctl() Interface
> +---------------------
> +
> +Two new prctl() calls are added to allow programs to manage the enablement
> +status for the use of Vector in userspace:
> +
> +prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
> +
> +    Sets the Vector enablement status of the calling thread, where the control
> +    argument consists of two 2-bit enablement statuses and a bit for inheritance
> +    model. Other threads of the calling process are unaffected.
> +
> +    Enablement status is a tri-state value each occupying 2-bit of space in
> +    the control argument:
> +
> +    * :c:macro:`PR_RISCV_V_VSTATE_CTRL_DEFAULT`: Use the system-wide default
> +      enablement status on execve(). The system-wide default setting can be
> +      controlled via sysctl interface (see sysctl section below).
> +
> +    * :c:macro:`PR_RISCV_V_VSTATE_CTRL_ON`: Allow Vector to be run for the
> +      thread.
> +
> +    * :c:macro:`PR_RISCV_V_VSTATE_CTRL_OFF`: Disallow Vector. Executing Vector
> +      instructions under such condition will trap and casuse the termination of the thread.
> +
> +    arg: The control argument is a 5-bit value consisting of 3 parts, which can
> +    be interpreted as the following structure, and accessed by 3 masks
> +    respectively.
> +
> +    struct control_argument {
> +        // Located by PR_RISCV_V_VSTATE_CTRL_CUR_MASK
> +        int current_enablement_status : 2;
> +        // Located by PR_RISCV_V_VSTATE_CTRL_NEXT_MASK
> +        int next_enablement_status : 2;
> +        // Located by PR_RISCV_V_VSTATE_CTRL_INHERIT
> +        bool inherit_mode : 1;
> +    }

Maybe just me, but the C bitfield is just confusing here. I'd remove
that, and just keep the section below.

> +
> +    The 3 masks, PR_RISCV_V_VSTATE_CTRL_CUR_MASK,
> +    PR_RISCV_V_VSTATE_CTRL_NEXT_MASK, and PR_RISCV_V_VSTATE_CTRL_INHERIT
> +    represents bit[1:0], bit[3:2], and bit[4] respectively. bit[1:0] and
> +    accounts for the enablement status of current thread, and bit[3:2] the
> +    setting for when next execve() happens. bit[4] defines the inheritance model
> +    of the setting in bit[3:2]
> +
> +        * :c:macro:`PR_RISCV_V_VSTATE_CTRL_CUR_MASK`: bit[1:0]: Account for the
> +          Vector enablement status for the calling thread. The calling thread is
> +          not able to turn off Vector once it has been enabled. The prctl() call
> +          fails with EPERM if the value in this mask is PR_RISCV_V_VSTATE_CTRL_OFF
> +          but the current enablement status is not off. Setting
> +          PR_RISCV_V_VSTATE_CTRL_DEFAULT here takes no effect but to set back
> +          the original enablement status.
> +
> +        * :c:macro:`PR_RISCV_V_VSTATE_CTRL_NEXT_MASK`: bit[3:2]: Account for the
> +          Vector enablement setting for the calling thread at the next execve()
> +          system call. If PR_RISCV_V_VSTATE_CTRL_DEFAULT is used in this mask,
> +          then the enablement status will be decided by the system-wide
> +          enablement status when execve() happen.
> +
> +        * :c:macro:`PR_RISCV_V_VSTATE_CTRL_INHERIT`: bit[4]: the inheritance
> +          model for the setting at PR_RISCV_V_VSTATE_CTRL_NEXT_MASK. If the bit
> +          is set then the following execve() will not clear the setting in both
> +          PR_RISCV_V_VSTATE_CTRL_NEXT_MASK and PR_RISCV_V_VSTATE_CTRL_INHERIT.
> +          This setting persists across changes in the system-wide default value.
> +
> +    Return value: return 0 on success, or a negative error value:
> +        EINVAL: Vector not supported, invalid enablement status for current or
> +                next mask
> +        EPERM: Turning off Vector in PR_RISCV_V_VSTATE_CTRL_CUR_MASK if Vector
> +                was enabled for the calling thread.
> +
> +    On success:
> +        * A valid setting for PR_RISCV_V_VSTATE_CTRL_CUR_MASK takes place
> +          immediately. The enablement status specified in
> +          PR_RISCV_V_VSTATE_CTRL_NEXT_MASK happens at the next execve() call, or
> +          all following execve() calls if PR_RISCV_V_VSTATE_CTRL_INHERIT bit is
> +          set.
> +        * Every successful call overwrites a previous setting for the calling
> +          thread.
> +
> +prctl(PR_RISCV_V_SET_CONTROL)

s/SET/GET/


Bj?rn

