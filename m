Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6FEF30295
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 01:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suLm6LJ4Me8LcWTVXwybARdlJBkD9smV2rKVfvF0nqY=; b=ppEYzBc397qVF5
	6rNXe4jnSdaygxbBoYpgpMNOHwFs1jOhvHVsW5GdzgxTruQgOtphjJpFhx4N2z1Lo82etNLKdc3oU
	ZsVm01f31GC4o0Z08sg5nS6RL28CwEVDNRr5QjCgAmqIToavPlqIPnV4bE6lhEw7EVFqFgpgQAwi2
	OF3oOGtc0+ZykLEFKxSugreB5JvBLL6yD9PnFIUih86SHsE+JSG5bKCz2DAZn8WaiYCA6Bq0IH6K2
	h1EY+kxHQ6hk3oEvy0FDNtxVqWUk7jl5VqJNqHYVQMQRY53R7phHKSO3Dv4LJ4iNgdQNC310cGAlJ
	hpvrfj9kpTPHyGXXFZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1x1h-000000038So-2A0f;
	Mon, 16 Mar 2026 01:45:49 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1x1d-000000038Qw-2igG;
	Mon, 16 Mar 2026 01:45:47 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowAC3XWm+YLdpa+wzCg--.590S4;
	Mon, 16 Mar 2026 09:45:35 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v5 2/2] RISC-V: KVM: selftests: Fix firmware counter read in sbi_pmu_test
Date: Mon, 16 Mar 2026 01:45:33 +0000
Message-Id: <20260316014533.2312254-3-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316014533.2312254-1-xujiakai2025@iscas.ac.cn>
References: <20260316014533.2312254-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3XWm+YLdpa+wzCg--.590S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGw4ftFW7ZFWkXFWDZF1DWrg_yoWrCry7pF
	WkGFWYkrWrtrnFyFy3A3ZFgr1UXan3ZasrKrW7Wry2yr4UXryfXrsIgF9Fyan8CFZYg343
	Aw1Iga1rCFsxJF7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
	M2kKe7AKxVWUXVWUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv04
	87Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67
	IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWr
	XwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
	uYvjTRJZ2-DUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBwwICWm3WbMoEgAAsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_184546_518982_05C00BB9 
X-CRM114-Status: GOOD (  12.84  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

The current sbi_pmu_test attempts to read firmware counters without
configuring them first with SBI_EXT_PMU_COUNTER_CFG_MATCH.

Previously this did not fail because KVM incorrectly allowed the read
and accessed fw_event[] with an out-of-bounds index when the counter
was unconfigured. After fixing that bug, the read now correctly returns
SBI_ERR_INVALID_PARAM, causing the selftest to fail.

Update the test to configure a firmware event before reading the
counter. Also add a negative test to ensure that attempting to read an
unconfigured firmware counter fails gracefully.

Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
V4 -> V5:
- Fixed alignment of fw_eidx assignment.
V2 -> V3:
- Removed unnecessary BIT(ret.value) & counter_mask_available check.
- Asserted ret.value == i after successful CFG_MATCH.
- Fixed eidx construction in SBI_EXT_PMU_COUNTER_CFG_MATCH.
---
 .../testing/selftests/kvm/include/riscv/sbi.h | 37 +++++++++++++++++++
 .../selftests/kvm/riscv/sbi_pmu_test.c        | 20 +++++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
index 046b432ae896..16f1815ac48f 100644
--- a/tools/testing/selftests/kvm/include/riscv/sbi.h
+++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
@@ -97,6 +97,43 @@ enum sbi_pmu_hw_generic_events_t {
 	SBI_PMU_HW_GENERAL_MAX,
 };
 
+enum sbi_pmu_fw_generic_events_t {
+	SBI_PMU_FW_MISALIGNED_LOAD	= 0,
+	SBI_PMU_FW_MISALIGNED_STORE	= 1,
+	SBI_PMU_FW_ACCESS_LOAD		= 2,
+	SBI_PMU_FW_ACCESS_STORE		= 3,
+	SBI_PMU_FW_ILLEGAL_INSN		= 4,
+	SBI_PMU_FW_SET_TIMER		= 5,
+	SBI_PMU_FW_IPI_SENT		= 6,
+	SBI_PMU_FW_IPI_RCVD		= 7,
+	SBI_PMU_FW_FENCE_I_SENT		= 8,
+	SBI_PMU_FW_FENCE_I_RCVD		= 9,
+	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
+	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
+	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
+	SBI_PMU_FW_SFENCE_VMA_ASID_RCVD	= 13,
+
+	SBI_PMU_FW_HFENCE_GVMA_SENT	= 14,
+	SBI_PMU_FW_HFENCE_GVMA_RCVD	= 15,
+	SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
+	SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
+
+	SBI_PMU_FW_HFENCE_VVMA_SENT	= 18,
+	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
+	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
+	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
+	SBI_PMU_FW_MAX,
+};
+
+/* SBI PMU event types */
+enum sbi_pmu_event_type {
+	SBI_PMU_EVENT_TYPE_HW = 0x0,
+	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
+	SBI_PMU_EVENT_TYPE_RAW = 0x2,
+	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
+	SBI_PMU_EVENT_TYPE_FW = 0xf,
+};
+
 /* SBI PMU counter types */
 enum sbi_pmu_ctr_type {
 	SBI_PMU_CTR_TYPE_HW = 0x0,
diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 924a335d2262..cec1621ace23 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -436,6 +436,7 @@ static void test_pmu_basic_sanity(void)
 	struct sbiret ret;
 	int num_counters = 0, i;
 	union sbi_pmu_ctr_info ctrinfo;
+	unsigned long fw_eidx;
 
 	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
 	GUEST_ASSERT(probe && out_val == 1);
@@ -461,7 +462,24 @@ static void test_pmu_basic_sanity(void)
 			pmu_csr_read_num(ctrinfo.csr);
 			GUEST_ASSERT(illegal_handler_invoked);
 		} else if (ctrinfo.type == SBI_PMU_CTR_TYPE_FW) {
-			read_fw_counter(i, ctrinfo);
+			/* Read without configure should fail */
+			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
+					i, 0, 0, 0, 0, 0);
+			GUEST_ASSERT(ret.error == SBI_ERR_INVALID_PARAM);
+
+			/*
+			 * Try to configure with a common firmware event.
+			 * If configuration succeeds, verify we can read it.
+			 */
+			fw_eidx = ((unsigned long)SBI_PMU_EVENT_TYPE_FW << 16) |
+				  SBI_PMU_FW_ACCESS_LOAD;
+
+			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
+					i, 1, 0, fw_eidx, 0, 0);
+			if (ret.error == 0) {
+				GUEST_ASSERT(ret.value == i);
+				read_fw_counter(i, ctrinfo);
+			}
 		}
 	}
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
