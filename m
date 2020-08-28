From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Aug 2020 10:27:04 +0530
Subject: [RFC 0/2] Add risc-v vhost-net support
In-Reply-To: <20200724085441.1514-1-jiangyifei@huawei.com>
References: <20200724085441.1514-1-jiangyifei@huawei.com>
Message-ID: <CAAhSdy2qtr4EpYjFM=REigrC7DK_Fo26P-SGhVC6n21FewtFvw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 24, 2020 at 2:25 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Hi,
>
> These two patches enable support for vhost-net on RISC-V architecture. They are developed
> based on the Linux source in this repo: https://github.com/avpatel/linux,
> the branch is riscv_kvm_v13.
>
> The accompanying QEMU is from the repo: https://github.com/alistair23/qemu, the branch is
> hyp-ext-v0.6.next. In order for the QEMU to work with KVM, the patch found here is necessary:
> https://patchwork.kernel.org/cover/11435965/
>
> Several steps to use this:
>
> 1. create virbr0 on riscv64 emulation
> $ brctl addbr virbr0
> $ brctl stp virbr0 on
> $ ifconfig virbr0 up
> $ ifconfig virbr0 <virbr0_ip> netmask <virbr0_netmask>
>
> 2. boot riscv64 guestOS on riscv64 emulation
> $ ./qemu-system-riscv64 -M virt,accel=kvm -m 1024M -cpu host -nographic \
>         -name guest=riscv-guest \
>         -smp 2 \
>         -kernel ./Image \
>         -drive file=./guest.img,format=raw,id=hd0 \
>         -device virtio-blk,drive=hd0 \
>         -netdev type=tap,vhost=on,script=./ifup.sh,downscript=./ifdown.sh,id=net0 \
>         -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"
>
> $ cat ifup.sh
> #!/bin/sh
> brctl addif virbr0 $1
> ifconfig $1 up
>
> $ cat ifdown.sh
> #!/bin/sh
> ifconfig $1 down
> brctl delif virbr0 $1
>
> This brenchmark is vhost-net compare with virtio:
>
> $ ./netperf -H <virbr0_ip> -l 100 -t TCP_STREAM
>
> vhost-net:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
>
> 131072  16384  16384    100.07    457.55
>
> virtio:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
>
> 131072  16384  16384    100.07    227.02
>
>
> The next step is to support irqfd on RISC-V architecture.
>
> Yifei Jiang (2):
>   RISC-V: KVM: enable ioeventfd capability and compile for risc-v
>   RISC-V: KVM: read\write kernel mmio device support
>
>  arch/riscv/kvm/Kconfig     |  2 ++
>  arch/riscv/kvm/Makefile    |  2 +-
>  arch/riscv/kvm/vcpu_exit.c | 38 ++++++++++++++++++++++++++++++++------
>  arch/riscv/kvm/vm.c        |  1 +
>  4 files changed, 36 insertions(+), 7 deletions(-)
>
> --
> 2.19.1
>
>

I will be squashing these patches into PATCH7 of v14 KVM RISC-V series.

I will also add your Signed-off-by to PATCH7 of v14 KVM RISC-V to
acknowledge your efforts.

Thanks,
Anup

