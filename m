From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 1 Feb 2024 09:24:28 +0530
Subject: RISC-V development board with Hypervisor Extension
In-Reply-To: <5d6ae3f1.37b4.18d62c44490.Coremail.snt.d-boy@163.com>
References: <5d6ae3f1.37b4.18d62c44490.Coremail.snt.d-boy@163.com>
Message-ID: <CAK9=C2WzUx_7rmtw4ZnUV33JbcPyvJZFOW54LVZiqvF1-vk_fg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 1, 2024 at 9:14?AM Steve He <snt.d-boy@163.com> wrote:
>
>
> Hi,
>
>
> Is there any development board with RISC-V Hypervisor Extension?
> Sifive P670 looks like the first RISC-V core that supports Hypervisor
> Extension, but hasn't find any development board for it.
>
> And what's your development env for all your RISC-V patches here? ;)

Most of us test on QEMU and Spike.

Some of us also test on internal platforms.

AFAIK, currently there is no publicly available board with H-extension.

Regards,
Anup

>
> Thanks
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

