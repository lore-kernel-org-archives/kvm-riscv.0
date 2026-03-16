Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767BDF30295
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 01:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VY/zxvSE3FUclWLVdGGep1O31Paj9wB3PAVdeST6xr0=; b=NyTDKFof3cIMEZ
	wefHLkVjqCjseISCnmyPgM3CiFDCqFPNIgeV61GR9xMMgshvzKioXhHOTtKNuNQQTagwAmh/Esdzs
	rZkxk6Hd7n9flaS5aDeJBIjODFLwuV+lvkMriYi3Ad8kIaIEkSnU1s3MkYSfAx6KKqQ8AuowRhWVV
	Jlb0KDFMZ+C207BSiFs3qteFhCKCcKaYi1OwzkLQ5vZ+AC3Qm8mKZUDLed/yd+rU4y3jLp7iF4/7b
	K7iTY0j3qbxE7ICGYdJXJ+WyWH5cPJ1uI6l2OLDZSJ05EIs/VUhkvxzZSIuyts5Vag+4vUjByuVPq
	n/SNrjEHiS+Gqk3XLDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1x1l-000000038UQ-0aHB;
	Mon, 16 Mar 2026 01:45:53 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1x1f-000000038R2-1B0U;
	Mon, 16 Mar 2026 01:45:48 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowAC3XWm+YLdpa+wzCg--.590S3;
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
	Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: [PATCH v5 1/2] RISC-V: KVM: Fix array out-of-bounds in pmu_ctr_read() and pmu_fw_ctr_read_hi()
Date: Mon, 16 Mar 2026 01:45:32 +0000
Message-Id: <20260316014533.2312254-2-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316014533.2312254-1-xujiakai2025@iscas.ac.cn>
References: <20260316014533.2312254-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3XWm+YLdpa+wzCg--.590S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCF1fCFW8Xw1rtF4kZw13Arb_yoW5Ww18pr
	47Kw1Yq395trs2vw1Yyw1Duw4Uta1kK3yDGrW7WF18Aw13Wry3JFyqg3sIqF43AF4Yqa4x
	tw1Iq3WxCFy5Xa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUdFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280
	aVCY1x0267AKxVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcV
	AaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0E
	x4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI
	8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_
	GFv_Wrylc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU8XJ55UUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAYICWm3WYgougAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_184547_723007_46D263DA 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

When a guest invokes SBI_EXT_PMU_COUNTER_FW_READ or
SBI_EXT_PMU_COUNTER_FW_READ_HI on a firmware counter that has not been
configured via SBI_EXT_PMU_COUNTER_CFG_MATCH, the pmc->event_idx remains
SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF). get_event_code() extracts the
lower 16 bits, yielding 0xFFFF (65535), which is then used to index into
kvpmu->fw_event[]. Since fw_event is only RISCV_KVM_MAX_FW_CTRS (32)
entries, this triggers an array-index-out-of-bounds:

  UBSAN: array-index-out-of-bounds in arch/riscv/kvm/vcpu_pmu.c:255:37
  index 65535 is out of range for type 'kvm_fw_event [32]'

Add a check for the known unconfigured case (SBI_PMU_EVENT_IDX_INVALID)
and a WARN_ONCE guard for any unexpected out-of-bounds event codes,
returning -EINVAL in both cases.

Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
Fixes: 08fb07d6dcf71 ("RISC-V: KVM: Support 64 bit firmware counters on RV32")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
V3 -> V4:
- Fixed WARN_ONCE argument alignment.
V2 -> V3:
- Added check for SBI_PMU_EVENT_IDX_INVALID.
- Added WARN_ONCE for unexpected out-of-bounds event codes.
V1 -> V2:
- Merged the fixes for pmu_ctr_read() and pmu_fw_ctr_read_hi() into a single
commit.
- Removed the pr_warn, simply returning -EINVAL instead.
---
 arch/riscv/kvm/vcpu_pmu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index e873430e596b..ca86c0000809 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -226,7 +226,14 @@ static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
 	if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
 		return -EINVAL;
 
+	if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID)
+		return -EINVAL;
+
 	fevent_code = get_event_code(pmc->event_idx);
+	if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
+	    "Invalid firmware event code: %d\n", fevent_code))
+		return -EINVAL;
+
 	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
 
 	*out_val = pmc->counter_val >> 32;
@@ -251,7 +258,14 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 	pmc = &kvpmu->pmc[cidx];
 
 	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
+		if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID)
+			return -EINVAL;
+
 		fevent_code = get_event_code(pmc->event_idx);
+		if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
+		    "Invalid firmware event code: %d\n", fevent_code))
+			return -EINVAL;
+
 		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
 	} else if (pmc->perf_event) {
 		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
