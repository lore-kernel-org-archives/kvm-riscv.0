Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2948CCC6B39
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mXKikZfzZO6NdjataMb1FWFfgeWSbVbDr7LmCobJcQ=; b=WNs3JXYL8e5eYS
	9gcSKiwge2lY9vGKdbb18iFZ7uM3o4B0ABuVtBM8wlhaBnj31fTeQSKEooQbWyWFNlthFGtsCisD3
	MrG2Wjp4Kg1olIJLdG4n3qC3dGEGZJ1NirYYw2ucTB9PqbrotOyw+yC75XAtYZ+dBuMZUW+OYy9bL
	fQY6rlgijuafCBFzUBf7xPEt0NM9cDGVp6PX1ZD9RNCtevkE7A1C+4Lu2rXcM0PtfChdiT0WyJUnO
	mALgnqn9c+yRiwKBdOulmjFoKUbM+SfALNwxvmlHawq380nZ9p8/5jyF/2+3zabYzxxkhlF1wiLzj
	meB6AzzPMzbjinZ0WrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFKp-0000000Gy8h-3LRm;
	Thu, 15 Oct 2026 06:53:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFKk-0000000Gy44-0mQw;
	Thu, 15 Oct 2026 06:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i+nGxBDeNHrURt50cav2JElIhE/s6s+8QIh+LVnoHjU=; b=WG5muOzr625HtGJ7eO4uY5Axum
	5CNK2+hA8Dcj5I/AWQMWw4n/1h7lHYyRhX7loG5meWAHSc/dHqLKBOQCikon+Ufrxprwo6uCFYDCI
	O2G0S7dOvGgZq/evjwIRidWWMKQR2GVgYXWW3ReWTGzG8x1L++rjKwSsl+xS4yNnLbtG6Xd3a8Mfg
	sKBrCnyWaBMXG1goOE2rSGcXqlTjlUvMOaYvhOQ4vFT1oyelskVq9rtBf6k7iX0p5nQKHJ/uyOoaZ
	9g3xg9HuQQF0CwxeE+5LQhBENCKLJ8W0MUPsk5hQvph+YRQIxi5MbSkrdz3BVlu9HHuXcL7Tvm7Y/
	unNOLGqw==;
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHFKg-0000000HXxd-2co9;
	Thu, 15 Oct 2026 06:52:56 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4j4zKY6WWxz4y4ZF;
	Thu, 15 Oct 2026 14:52:49 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl1.zte.com.cn with SMTP id 69F6qhc5013948;
	Thu, 15 Oct 2026 14:52:43 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 15 Oct 2026 14:52:45 +0800
X-Zmail-TransId: 3e816ad0783c024-5556e
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Tomasz Jeznach <tomasz.jeznach@linux.dev>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fangyu Yu <fangyu.yu@linux.alibaba.com>,
        Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517025@gmail.com>
Subject: [RFC PATCH 08/12] iommu/riscv: Add riscv_iommu_hw_info
Date: Thu, 15 Oct 2026 14:52:28 +0800
Message-ID: <20261015065232.604503-9-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 69F6qhc5013948
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 15 Oct 2026 14:52:49 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD07841.001/4j4zKY6WWxz4y4ZF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_075255_185121_F89FC770 
X-CRM114-Status: UNSURE (   9.20  )
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

From: Wu Fei <wu.fei9@sanechips.com.cn>

Implement the hw_info op, report the IOMMU Capabilities register value
to user space as IOMMU_HW_INFO_TYPE_RISCV so VMMs can discover the
hardware capabilities of the physical IOMMU.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 drivers/iommu/riscv/iommu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index c34331bcd661..e59a6a97589e 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -2220,9 +2220,27 @@ static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *h
 	iommu_dma_get_resv_regions(dev, head);
 }
 
+static void *riscv_iommu_hw_info(struct device *dev, u32 *length,
+				 enum iommu_hw_info_type *type)
+{
+	struct iommu_hw_info_riscv *info;
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+
+	info = kzalloc_obj(*info);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	info->capabilities = iommu->caps;
+	*length = sizeof(*info);
+	*type = IOMMU_HW_INFO_TYPE_RISCV;
+
+	return info;
+}
+
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
 	.capable = riscv_iommu_capable,
+	.hw_info = riscv_iommu_hw_info,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
