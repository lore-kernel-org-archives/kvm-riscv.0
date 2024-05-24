From: Shaoqing Qin <qinshaoqing@bosc.ac.cn>
Date: Fri, 24 May 2024 10:50:26 +0800 (GMT+08:00)
Subject: [v2][kvmtool PATCH 0/1] riscv: Add zacas extension
Message-ID: <5a455c13.48.18fa881bf58.Coremail.qinshaoqing@bosc.ac.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024/5/24 10:10, Shaoqing Qin wrote:
> 
>> The functionality has been tested on QEMU, the tests rely on kernel(6.9) and qemu
>> support for zacas.
>> If you want to test, you could use the following version we released for testing.
> 
> About aobve message about:
> 
> This patch is to enable Zacas ISA extension for VM.
> 
> You could try this patch with below dependencies:
> 
> kernel:
> mainline  6.9
> qemu:
> https://github.com/OpenXiangShan/qemu/tree/riscv-zacas
> 
> 
 >
 > About aobve message about:
 >
 > This patch is to enable Zacas ISA extension for VM.
 >
 > You could try this patch with below dependencies:
 >
 > kernel:
 > mainline  6.9
 > qemu:
 > https://github.com/OpenXiangShan/qemu/tree/riscv-zacas

This feature has been verified on QEMU with zacas supported [1] + 
upstream kernel(v6.9)

Link: https://github.com/OpenXiangShan/qemu/tree/riscv-zacas [1]
---

> qinshaoqing (1):
>    Add support for (ratified) Zacas extension
> 
>   riscv/fdt.c                         | 1 +
>   riscv/include/asm/kvm.h             | 1 +
>   riscv/include/kvm/kvm-config-arch.h | 3 +++
>   3 files changed, 5 insertions(+)
> 

