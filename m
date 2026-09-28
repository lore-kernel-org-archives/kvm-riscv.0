Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D3ECA5FA5
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8VLGkCcwZlX8P0SfPaTDeDosRw/Ooz53AztS/g/8zg=; b=xKeSD9z/nxcLI8
	EKxUW0h6/NN6HEd9d3B6PsjmWn6Tuzrdo0eoGgQ2zoCCUlP4sDyT7h4U8V9dS1Dpul8L1PbmGkd9E
	D1BDqMAVFbK8LojRN3jVGHISGRxTl0xX0Jp3yZpfQxnMtKNaPvQwvYxEFaqSux3awd4ThUuRhFhrh
	bmAih4QP+TFjN/rfClMjajNukD0eYE4V3nNhGG/z3IMWxLFkYEmIxgqvp3v2Fxl+d2ab9B1PSmjYE
	DSPoe9+r6VMLLbL36d9L4YXetnzzLxCZ3DpcV55dJKh0IPAJOV8NV0oNREuhGrWrcl47aoL0+Fr9S
	/hSdK04sEIwlS6BFi3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCV8-00000000n2F-2fkw;
	Mon, 28 Sep 2026 14:38:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCV7-00000000n1X-1GIS
	for kvm-riscv@bombadil.infradead.org;
	Mon, 28 Sep 2026 14:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cTgrUnplzPTsiEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=; b=NSRjhqQXpnB/zrSa04c7CemMgg
	x1AUSj0Vpm8TN4NH/RdpSKzjXlajkVgfimx2pfyIpRg07c8oTeVFZun6Q8U2ZThUgS2BJJvRWR95x
	IbvSFDCFLNaAAoox+EnagPEKnr40jdxNehu/NIWAt/+0CDodBlbq5/mtb8KBVId2T3AZ16Mn5LAdB
	Dqx3c42B+b1zEBZX+SHPIfnL1uUhruntanO+pB31sT7EqLHi9Hn+6fPhr4hwcGSc1R/ftxBYxcQ4O
	S0ULK0iIAG40l5qERyBFIIaRqcBB91ANTXcsssdLAZ+gNCIqWY4Ld3/iLhkAuNuTFxYdpSr+e7Eg1
	ymxHTC1g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCV4-00000001Zvd-1yL3
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:38:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA8au481583
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cTgrUnplzPT
	siEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=; b=c73uNlh2ZtQ7oej8s2yZmevZ3k7
	REywjteFYrK1X5Mt2oFWX74+RMx/ANasUOMEci/WYpFAXC3eDSM5KKAzRlk3ReD7
	NUZtqsG30imxmipV6zJe4iKrMnyIydGyy5CtfKz83zRJXFTE9OM969wZ2NXR5Otv
	NAIQbJtoaIKI6VIJsMCp6Qw8twxVRMN/oM3cmg5y/rJX49tS6VfHXrbIsMlLtvre
	iX79BU25HrE3sHCpqucTiplywvFHg7xkKlgxy/GHBb+IBd7JAdfRd4vtTxc5ZUER
	GbzudQZgtsGlq26wWi4UY2xGnSHc4G2L9c73XXMYhDJooGSRemk8PoT7n/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt11vkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91431adf55eso59726286d6.0
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606316; x=1791211116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTgrUnplzPTsiEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=;
        b=BOoW6SoXRkPk5URVmLh8AaZacYulaIKk9sVFF+2vlDHXZsUxyiOKbVM63P7UiGOMhd
         zYLRwmMrz3bWZmfbnVm5GFx5FMHIVKMzflUna9stt1zBu++icn6obaUy7GJ4JfVpDWM6
         BkRBUwsZcsAkA70k8AiivH6VAjPjGKW9G2mee+resvDNw0IdJqWhLS4PPh/jYVF3Ik7D
         4T0mg6sbS44g5gIqTbloWOb9/+zPgCAVpMyLnB5atE1BGp4tJ7kNr4R3gQEBLprf4nbl
         UDYDak7r7xAazdJyY2HqF9NEO14Wthk3hPXs4LLHEFH8yX7H0LlC8/4kzQRW928FZzZJ
         YNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606316; x=1791211116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTgrUnplzPTsiEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=;
        b=Surlk0cA4c2+2d2FzAmELhSCh7iAXzms2RXZbcr7J4AJUw19848vyutuCb5bchl+L9
         McnhS9aEZ/KSFnHwDom4iY8y0RCUH5GgB66LF7l8sA1VQyCJVt/GPpNbX7wJwxRLlYEX
         HcymIU0w5zrVsV28sBS0MvI9vwNaF/GTRR42n4kc3KKt/0+VKfHbU8HKsve54XKddLwZ
         YhNjj+8PZuCskEtsC/5WNVBazD7wqDfXL40yXli5KJoaHo9byhAIVqwG56J0mTsYfyOl
         D3Mg6/lp7VdHfVQGe6L6S+Yl2Hn3PKY3O07IyYYkdHzs5IwZxMBTx7yXciI8hA6tGUvd
         6uyg==
X-Forwarded-Encrypted: i=1; AKwUvBxYKCiNy8fVuOoiUWAS8icUUFtLyRSsn1PT4pqy5E7XvqYFtmEkYq8EGn6I6wm3+TEvfTKggqJl/m8=@lists.infradead.org
X-Gm-Message-State: AFuF++koNNYBwxuaa3eSRBtnssH9WNsIVSDy8bVeUS3AvBYt52boKHpZ
	egW2jr/yOmZzoA0VEpPfqUQR/J7+7AtfKGcSlbEUuGe9nLLkHKHwRhW4S/KMa1vP/WQ4puT5tG6
	6GmAJYKuAM8Ocz2G5xvZNu9S8sgG9d5zczzmSW4nL8qPyTzVPYqAk4B53N+VJj1WkFfkB4AscdA
	mq
X-Gm-Gg: AYBFou0u9gJWNSkNg3fB7gntPlQhrmVvpQSFePtwTtNaxEtM6MoA4J6bBb8DesKqdxG
	iydoAYWuv7yYHciGddj/bc616+E8cesQ3SEhyChWGP/UGf9VK4+IQ/QWPS80J5pPkNeCANiPh7W
	xQXR3ekobqtkN/MdthS9+VsxhP9ohwY32LkMCFWBdAJ7I/OZKUSts6Ulix1s2+YYegH4QeH43hN
	LYO2kGjFac4B1b5ofDlJku06UwcZuVmjzTNHvGgTKuDVtAReFvTrrqBWhKXGLyMNYiC4EadSBt/
	mRXu3duKZW6ad2He1eeATuqxvEnVBtHPEC8Iyz2lsODbQy8xmjIynMiI6nnad2antnBkySurX7M
	nlVUOeN1wCH0NlFr9kLhvbofPhXNfd8og9JRqXw==
X-Received: by 2002:a05:6214:dad:b0:914:4ec1:83d4 with SMTP id 6a1803df08f44-9144ec199b5mr159346476d6.35.1790606315409;
        Mon, 28 Sep 2026 07:38:35 -0700 (PDT)
X-Received: by 2002:a05:6102:2b89:b0:7b7:6dec:6eb0 with SMTP id ada2fe7eead31-7b76decd903mr718307137.15.1790605931408;
        Mon, 28 Sep 2026 07:32:11 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbed87650sm291164166b.50.2026.09.28.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 08/14] irqchip/riscv-imsic: Define IOMMU IRQ bypass protocol
Date: Mon, 28 Sep 2026 16:31:07 +0200
Message-ID: <20260928143113.49838-9-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfXx3v7KtFlv9mC
 1mxThGvE7AbvAfVbyBuwu0P+25yyu0f6K3kxu9IHtIRsnkzKWGbhEHiaJlT4SJQI9+mQkpj22MV
 RtUkkg/JqfSOQmMec1SdZ7do3rD+n9fxOGgJ/kRR1EDHxIJaKHw7ErYvjgTW6WDz3X3qRdkRp+d
 52CNh9G8Qx4Si4rDt/3jcMn3L7AJFL+eRaMfl8v55/63llPfi5dSJSuiDndz90ezc6nA3+/yc+N
 lHTE1uUAuxKeh7dFvxuxuCDmj73ZmnUy4+QdO3vlUBLsRzxI8KXHAlVchFlUMWyYfHJPfdAYGgM
 unYyUvEeIHlqjTezFfTMbT/i3Q6PpgFWDqRupRxggQZF7JyPO8uOsUKTeae1Oc1K1iMXoB0CDcG
 HgYU93u1FVy8A5Hx0qrfMH5AKzM4EQ6WZH3IPlRphjQp6PV8bMjal08/uvIuBZ74f0o8KqyJI3k
 gdMy5x3cxXKHstVma5A==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba7bec cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4AuT_VmNVbg3FCPyVe8A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: vd6uynNQaY_f_CON2oZ9AuHZKmhXmj69
X-Proofpoint-GUID: vd6uynNQaY_f_CON2oZ9AuHZKmhXmj69
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX5b3FlnzY3uSU
 ynt7+pEMHp6bZf5ghbGirJBHoOxmyoYaHj1yj2C/abdJb2/tbN55McoA99JoWldAbUwuvie4y2Y
 jwPr0al9xvPJ66l1NNqU/Kv+m+P4zEQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153838_734821_67BF51D2 
X-CRM114-Status: GOOD (  16.42  )
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

Define the RISC-V IOMMU payload for irq_set_vcpu_affinity(), including
domain-wide target setup and individual target updates for IMSIC and
MRIF targets.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 include/linux/irqchip/riscv-imsic.h | 52 +++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 662cb0442424..d024a6524baa 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -104,4 +104,56 @@ struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
 static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev) { return NULL; }
 #endif
 
+enum riscv_iommu_ir_cmd {
+	RISCV_IOMMU_IR_INVALID_CMD,
+	RISCV_IOMMU_IR_FORWARD,
+	RISCV_IOMMU_IR_UPDATE_TARGET,
+};
+
+enum riscv_iommu_ir_target_type {
+	RISCV_IOMMU_IR_TARGET_INVALID,
+	RISCV_IOMMU_IR_TARGET_IMSIC,
+	RISCV_IOMMU_IR_TARGET_MRIF,
+};
+
+struct riscv_iommu_ir_target {
+	u64 gpa;
+	enum riscv_iommu_ir_target_type type;
+	union {
+		u64 hpa;
+		struct {
+			u64 mrif_hpa;
+			u64 notice_hpa;
+			u32 notice_id;
+		};
+	};
+};
+
+/*
+ * FORWARD enables forwarding for one IRQ and provides the complete target array
+ * so the first forwarded IRQ can initialize the domain MSI table. UPDATE_TARGET
+ * replaces one target without changing per-IRQ forwarding state. The caller
+ * must quiesce all MSI producers using the table when changing both words of a
+ * live MRIF PTE because the update temporarily invalidates the entry. A NULL
+ * vcpu_info disables forwarding for the IRQ.
+ *
+ * A well-formed request which is incompatible with the producer or current
+ * domain configuration returns -EOPNOTSUPP, allowing the caller to fall back
+ * to host delivery. Invalid payloads return -EINVAL and operational errors are
+ * propagated.
+ */
+struct riscv_iommu_ir_vcpu_info {
+	enum riscv_iommu_ir_cmd cmd;
+	const void *owner;
+	u64 msi_addr_mask;
+	u64 msi_addr_pattern;
+	union {
+		struct {
+			const struct riscv_iommu_ir_target *targets;
+			unsigned int nr_targets;
+		};
+		struct riscv_iommu_ir_target target;
+	};
+};
+
 #endif
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
