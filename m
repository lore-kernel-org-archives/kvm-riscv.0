Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C320CE7DEE3
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/cj4rFhSww3/LHY/YRY7/aJMkxaqiojKw/Rsrxm4FI=; b=LfvllwQypZK8QX
	0/JU1zO2L1PojvJ3FHwTPzsj+O08VAZhRmXxEK5aUxZb5DAlMqW90F3AmiY2pdMjpwrXELg4rRRoL
	3ybDoz3nXHIiL+HCVDIrluDAOmxWALNqeJFsskCKy26ApgjtFGA8jrxrzbYrIev9l5+uI1Rp56LWd
	e+RL+wNdPOzmYPwAS2he1cETT7NI1yhTMfx9NuXtVch5OhHp6ZL0n4SZSnoetkN7FDScq87dC/S+Y
	8R1I3ce76MzzVRHqQHiX4O1vnIgHJD8pXJsR86AtT62QQo7Yh1nyOA1glVsmQ1flIbq1CnBr4jrXQ
	w/wWGrpC5z86ut9VG9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmukY-000000055Qd-267e;
	Mon, 02 Feb 2026 14:17:58 +0000
Received: from out199-3.us.a.mail.aliyun.com ([47.90.199.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmukV-000000055PG-3ZUo;
	Mon, 02 Feb 2026 14:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770041266; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=c7nf1V7kmJWw/Odnsc78VRe3jSjZG2g5QRkqoKh8BQo=;
	b=eOo55kFgiwRmksXSuGmjR9MhsT08GfdNWIjNvFc3K4v592HqzC9ByYsf6VptpL9NAc/zR3JVs9FQsmVcRd+wf0JLafwGVlc8V0He78MMlsRi7yx7KFvbc1miXv/Sd7b4bTzbV/A1eQuB8RjEg04W5zrBTXGApzNiLUeowuTH1MM=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WyO62Yz_1770041257 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 02 Feb 2026 22:07:39 +0800
From: fangyu.yu@linux.alibaba.com
To: pbonzini@redhat.com,
	corbet@lwn.net,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	ajones@ventanamicro.com,
	rkrcmar@ventanamicro.com,
	radim.krcmar@oss.qualcomm.com,
	andrew.jones@oss.qualcomm.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v4 4/4] RISC-V: KVM: Define HGATP mode bits for KVM_CAP_RISCV_SET_HGATP_MODE
Date: Mon,  2 Feb 2026 22:07:16 +0800
Message-Id: <20260202140716.34323-5-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
References: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_061756_155363_BAFF6E7B 
X-CRM114-Status: UNSURE (   5.77  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Define UAPI bit positions for the supported-mode bitmask returned by
KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE).

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 54f3ad7ed2e4..236cd790cb13 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -393,6 +393,9 @@ struct kvm_riscv_sbi_fwft {
 /* One single KVM irqchip, ie. the AIA */
 #define KVM_NR_IRQCHIPS			1
 
+#define KVM_RISCV_HGATP_MODE_SV39X4_BIT  0
+#define KVM_RISCV_HGATP_MODE_SV48X4_BIT  1
+#define KVM_RISCV_HGATP_MODE_SV57X4_BIT  2
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
