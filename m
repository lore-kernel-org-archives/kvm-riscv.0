Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ABBFCC9C4
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 05:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7g0bpk4GBDSHdMgOguvUzkharyJfpHaD3LpSFnUamrc=; b=J/D1M/UKoV5Gf+
	YH2bWIW7qnaaSdVMYTL69fhFCNmwxWUq1RETxBkWkG/kXPSlHQhvSa+xGj3tUoJfh+7uwSa/U6/Q7
	pQxtrsGCLVYuFt2OE53kM/HikvYWm8KTIwGO3efN5MKc2DwmsDcky/2S/EZVn96jJ2+48YoI6PNBM
	HeW3yzy2saYcKo8w91T4dnuW8dPAIEjQhks9wnmf3hgrSTHTnqprZiAcHGwJGppHtW2jOe56LWB4+
	8BulDUCSCiLtzVup2OwWp24ENu2g3QaNHA3DgmoG98p3VBt/S5ykL+QJ2HvInvHaCWBUgybT4kssX
	3Tje12j7cT6Z1kDawFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzq5G-00000008lBw-2ol1;
	Tue, 10 Mar 2026 05:56:46 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzq5C-00000008lAq-30kH;
	Tue, 10 Mar 2026 05:56:44 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAC30Ndvsq9p08A4Cg--.55585S2;
	Tue, 10 Mar 2026 13:55:59 +0800 (CST)
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
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: [PATCH v3 0/2] RISC-V: KVM: Fix array out-of-bounds in firmware counter reads
Date: Tue, 10 Mar 2026 05:55:55 +0000
Message-Id: <20260310055557.835531-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAC30Ndvsq9p08A4Cg--.55585S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4fXw45Cry8Ar47tF4DXFb_yoW8Xr1xpF
	ZxKa4YkrykJrs7t343A3ykJw15Xrs5Ca98Gry7GF18Cr45ZryfXryqk3sxtF1rCrsYqw1Y
	ka1Igas7CFy5Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67
	AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjZ2-5UU
	UUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBgwCCWmvomAt5wAAsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_225643_144232_7DCEABBE 
X-CRM114-Status: UNSURE (   6.78  )
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

When a guest reads a firmware PMU counter via
SBI_EXT_PMU_COUNTER_FW_READ or SBI_EXT_PMU_COUNTER_FW_READ_HI without
first configuring it with SBI_EXT_PMU_COUNTER_CFG_MATCH, the counter's
event_idx remains SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF).

get_event_code() extracts the lower 16 bits from event_idx, yielding
0xFFFF, which is then used to index into kvpmu->fw_event[]. Since the
fw_event array only contains RISCV_KVM_MAX_FW_CTRS entries, this results
in an out-of-bounds access that can be detected by UBSAN.

Patch 1 fixes the issue by validating the firmware event code before
accessing the fw_event array and returning -EINVAL for invalid values.

After fixing the kernel behavior, the existing KVM selftest
(sbi_pmu_test) fails because it attempts to read firmware counters
without configuring them first. Patch 2 updates the selftest to
configure a firmware event before reading the counter and adds a
negative test to ensure that reading an unconfigured firmware counter
fails gracefully.

6eanut (2):
  RISC-V: KVM: Fix array out-of-bounds in pmu_ctr_read() and
    pmu_fw_ctr_read_hi()
  RISC-V: KVM: selftests: Fix firmware counter read in sbi_pmu_test

 arch/riscv/kvm/vcpu_pmu.c                     | 14 +++++++
 .../testing/selftests/kvm/include/riscv/sbi.h | 37 +++++++++++++++++++
 .../selftests/kvm/riscv/sbi_pmu_test.c        | 20 +++++++++-
 3 files changed, 70 insertions(+), 1 deletion(-)

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
