From: Jiangyifei <jiangyifei@huawei.com>
Date: Wed, 12 Jan 2022 08:04:28 +0000
Subject: [PATCH v4 02/12] target/riscv: Add target/riscv/kvm.c to place
 the public kvm interface
In-Reply-To: <CAKmqyKOOD-iRxX8aj7V2Vtfmi6=i9jCDT=0qgUvxX1j1DOOHXg@mail.gmail.com>
References: <20220110013831.1594-1-jiangyifei@huawei.com>
 <20220110013831.1594-3-jiangyifei@huawei.com>
 <CAKmqyKOOD-iRxX8aj7V2Vtfmi6=i9jCDT=0qgUvxX1j1DOOHXg@mail.gmail.com>
Message-ID: <d0b2766fb1c3465095c76e2b1efbae5c@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Alistair Francis [mailto:alistair23 at gmail.com]
> Sent: Tuesday, January 11, 2022 7:10 AM
> To: Jiangyifei <jiangyifei@huawei.com>
> Cc: qemu-devel at nongnu.org Developers <qemu-devel@nongnu.org>; open
> list:RISC-V <qemu-riscv@nongnu.org>; kvm-riscv at lists.infradead.org; open
> list:Overall <kvm@vger.kernel.org>; libvir-list at redhat.com; Anup Patel
> <anup@brainfault.org>; Palmer Dabbelt <palmer@dabbelt.com>; Alistair
> Francis <Alistair.Francis@wdc.com>; Bin Meng <bin.meng@windriver.com>;
> Fanliang (EulerOS) <fanliang@huawei.com>; Wubin (H)
> <wu.wubin@huawei.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>;
> wanbo (G) <wanbo13@huawei.com>; limingwang (A)
> <limingwang@huawei.com>; Anup Patel <anup.patel@wdc.com>
> Subject: Re: [PATCH v4 02/12] target/riscv: Add target/riscv/kvm.c to place the
> public kvm interface
> 
> On Mon, Jan 10, 2022 at 11:48 AM Yifei Jiang via <qemu-devel@nongnu.org>
> wrote:
> >
> > Add target/riscv/kvm.c to place kvm_arch_* function needed by
> > kvm/kvm-all.c. Meanwhile, add kvm support in meson.build file.
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Mingwang Li <limingwang@huawei.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  meson.build              |   2 +
> >  target/riscv/kvm.c       | 133
> +++++++++++++++++++++++++++++++++++++++
> >  target/riscv/meson.build |   1 +
> >  3 files changed, 136 insertions(+)
> >  create mode 100644 target/riscv/kvm.c
> >
> > diff --git a/meson.build b/meson.build index 53065e96ec..7eaec31a3a
> > 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -90,6 +90,8 @@ elif cpu in ['ppc', 'ppc64']
> >    kvm_targets = ['ppc-softmmu', 'ppc64-softmmu']  elif cpu in
> > ['mips', 'mips64']
> >    kvm_targets = ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu',
> > 'mips64el-softmmu']
> > +elif cpu in ['riscv']
> > +  kvm_targets = ['riscv32-softmmu', 'riscv64-softmmu']
> >  else
> >    kvm_targets = []
> >  endif
> 
> Can you add this as a separate commit at the end of the series?
> 
> That way we have implemented KVM support before we enable it for users.
> 
> Alistair

Yes, that makes sense.

Yifei
