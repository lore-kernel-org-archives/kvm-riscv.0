From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Sep 2023 11:51:59 +0200
Subject: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
In-Reply-To: <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
Message-ID: <20230914-d2e594e7d84503ad14036e2d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 14, 2023 at 09:37:03AM +0800, Haibo Xu wrote:
> Add a KVM selftests to validate the Sstc timer functionality.
> The test was ported from arm64 arch timer test.

I just tried this test out. Running it over and over again on QEMU I see
it works sometimes, but it frequently fails with the
GUEST_ASSERT_EQ(config_iter + 1, irq_iter) assert and at least once I
also saw the __GUEST_ASSERT(xcnt >= cmp) assert.

Thanks,
drew

