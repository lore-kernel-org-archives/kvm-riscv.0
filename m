From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 15 Sep 2023 14:21:41 +0800
Subject: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
In-Reply-To: <20230914-d2e594e7d84503ad14036e2d@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com> <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
 <20230914-d2e594e7d84503ad14036e2d@orel>
Message-ID: <CAJve8onhY534T=Hyncjfi4GfdZ+0D2xM+jRSaYCAWCdaKxPUcQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 14, 2023 at 5:52?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Sep 14, 2023 at 09:37:03AM +0800, Haibo Xu wrote:
> > Add a KVM selftests to validate the Sstc timer functionality.
> > The test was ported from arm64 arch timer test.
>
> I just tried this test out. Running it over and over again on QEMU I see
> it works sometimes, but it frequently fails with the
> GUEST_ASSERT_EQ(config_iter + 1, irq_iter) assert and at least once I
> also saw the __GUEST_ASSERT(xcnt >= cmp) assert.
>

Good catch!

I can also reproduce this issue and it is a common problem for both
arm64 and riscv because it also happens in a arm64 Qemu VM.

It seems like a synchronization issue between host and guest shared
variables. Will double check the test code.

> Thanks,
> drew

