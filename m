Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805C2CA5FA2
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xWC9JjxuV4fYejImSdsCCJ4x4goP5HRXep0mcIS5BM=; b=G2PvNDQ+dsVXC8
	y+Wl8Jx5Wk4FwsvBvz8K9OsKyxBzgctuZqBsyjzBJAYuZrXgSNcxXX2L3zz8uW+nOn1a5MIH1Jf37
	pq1/4BRqHPnxccy8DFc7kVSYIEMEUfwg9fMP7/C+eV0wmDeclTdxIRpOrPj4YK77Dd+nlqPIFXtFh
	frB5mE0O+zU509QkNO3glJvC8s1xvCufO2MgznuW5uDhdHsVjxPcrUcdvhIhMzJtE2EH5BfQIL8yb
	iNC6y/cXqvwT9XRjws+6JIjeoEzdDesskbcOnhhqxWSI1Dg4yDV9wnER4JuxntghtpQm5Jjf7sutk
	rt/JKHHdaaWBvmL99eNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCUn-00000000muE-0tH1;
	Mon, 28 Sep 2026 14:38:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCUl-00000000mtP-1NNL
	for kvm-riscv@bombadil.infradead.org;
	Mon, 28 Sep 2026 14:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=; b=PoPn3AkLnvFh7lsCrV/TOF5G6y
	wJXZqQmapqoxW5zsz4ZaNDbFwkRSUcbg64KMPi+nu7bg1PasWbfbZ5tH8HHTHZtUfQYpa7djl4EKU
	RcxTAqOf3X5/Rg01eOkTlT9lU3CmsMi9zbGyPhRmxh9xBwKdAgdsnHzClvnQZpQxrbdlSP+G6ZNkb
	VCniCU3Z4Y3wgO2QNB4KVmZTw/ivcFQoBw3mBVLG5XLKBRrlbpU1Sa/t1ZOJ+tHyNYch2IworRiz+
	Xq4QVABU/0YE9leOXINZodCHnHkNMIDyoWASTQZH2rFUTlhfh3tHjPr9Mm5yAhxWmuDym2ljNgou+
	VFlJDAAQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCUi-00000001ZsS-0icE
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:38:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBABtN1682790
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=95f+Fzhwpw4
	3Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=; b=MMdr6s/ssYyFfuRlTdQjkQCbpmb
	f/ssEosnetm8jJ4kwLwqF35IMwwxxbL4dnl7LoGzzMRtqh3+R+xinaj7DNfgQ2Ga
	8Fy160rzhWysrV3GR7XiQJDH+kWFFlADerqmc9BHUEef8rnpccfEYuLFzmMdATsB
	3d2OuWjIf3U7Prn4tYsYMPvq3Yh6ANS8f2CrHpLroXfPgZYFJZ4MPiD20cw34Pcr
	vCMizsLjBIUMxH2yqZe2hiOP18Jmug11NTuvzHNS/3eQDvoYcgZz/vzUVJIcrpMO
	r9JmFn7Ah9My+daLge+eNX8ZN37hIulxY9tCaDYmtwqRS7UJEo6600umIpQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfks61w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-882905daabaso1695181b3a.0
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606293; x=1791211093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=CJuFNyjM0truVjSuuQkicQKSUhvo9vuQbeK4l9MQjjQF62Qj1RnOaGFcHeQ5tVrvTp
         +DYcIIz+LljkZjejNEeQE5oTa1LmKNna3Zu/7nHi4HzVem7l698D95lIf3PgGsmGfPMx
         2sgQA4imiBZGdeEsb+JyjHS6XXwAyw09mUfR/JmsJXWJcZG0TKREsElIQ6jhIbmK2EIy
         oHvCctcpW7O6n5OMuNmOyLeYeGYK+e8NIT4kcp85bhSyRRg4Lpi1waREsvbbPZhAwLjs
         xJXMMZnnFdFk2QPlQFZu9p/dM7HJLOaGasgg/wuNTfnA8bLkuq93Kd8iIc/11ytVw6Mi
         tgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606293; x=1791211093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=Na36WF7tpWLSE3VE25mcTIRa7QsFa+JxMI1xUCnud1/f/JIf9B/euZ5up8QTycyw9I
         v5lOcORb3qpk01auk1CB5wz8HfHMBu/dW/y7Lz/fMbHvo7Ck+L0Y+2FvkOyYzXIrBkUa
         iSGOJfOVEZoNBovPL7pu6F7SOtNi7FWUmsoyaH7pPyMdIqksvE5PrG+ocp4dJb1+L8qs
         j+TNN8URjRGC22BLuNN0MjWVyPssWP9zP4vh4kScz0cO4KTvI0S9WCx4nRo8DGVu8AZY
         rBWXsY4xAp3cXjt55TuOXZ60Svi0hPteX+BtNW2l+Jz4t42HH4MrETGJhOtv4/wYesEV
         bxKA==
X-Forwarded-Encrypted: i=1; AKwUvBx4OiU6KlvS25KiSPkI0I0QlThWXmtzwV5AHb/QfxhZ/5Akk6h6hPMKx+JEgUoPCHe6k9anEVPdl8I=@lists.infradead.org
X-Gm-Message-State: AFuF++liESGDMDrXaP1yN2g0GsOycuvNTYh85D2tOiYpHWiVeKvu17oP
	6wXcZFbzDubypYtMjvxPrOQxzzNfAimQoj7w5oPG8w0Oncuw4gG7T2d0GAuKsE31IK4dU85RtAY
	pJIMVbxt+wQvDmFKJkSAKQCbJlGgii5w53GmXQPuoWAIcSDlPfTbh81R5HXMH+/mrHdBekgWvJ9
	5M
X-Gm-Gg: AYBFou0HYU1d1bJ/IVMn9pZ/bDl2rbOUUCLx/pQstX5L5CLASif4KHohfOFln6Vf/0I
	assrwjr5D1sMAKAMsIj9sohuVCxMMuPOvtF7WLYN1dSADERim1YVgZNhnzwAMKZvZCfci4TQdc6
	U/T8NoFQpb6wDUEU0GJdZlqBx4xXK3D1F7J4fJPP6nsXdIiKGvPTAy55geyo2300vcHjNxtczuS
	GRD1Hh5MU61gO11N3dgaNjcFg3sWeHUY521eK3FQy/gy0S6XAs9afy0yzWlMuJ1eEveG2eTYcBH
	wH1VPVWvJPMQJzJlzrXPrAhWPyqdIKAJJpz2P4/HSkK7P3BfpxEzkBgXTN2ukQOGC5usYp8+LFK
	dsZXiZvSnZ3S8t1W+OyWqItSeePMLXdlmvaOV2w==
X-Received: by 2002:a05:6a21:150d:b0:3de:773c:df14 with SMTP id adf61e73a8af0-3de773ce2f5mr763335637.24.1790606293157;
        Mon, 28 Sep 2026 07:38:13 -0700 (PDT)
X-Received: by 2002:a05:6102:3306:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7af1d09c695mr3831186137.11.1790605933082;
        Mon, 28 Sep 2026 07:32:13 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cba0ffsm4345440a12.5.2026.09.28.07.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:12 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [RFC PATCH v3 09/14] genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
Date: Mon, 28 Sep 2026 16:31:08 +0200
Message-ID: <20260928143113.49838-10-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX416aotx83bdq
 ZVis2MgKjSmg5PZLXAK5wqYJsr85wC0F7tRKcV2lyTUT/CBDaUR34tQtXgKrCJcsApaLfZtfb2Q
 +bZVYvUvVLQ9thBW6w/yd/DFzugqcpGoC9bV/YMHpQwv0mis8fUyEiLOYqudCrRKCT4G3HRr5uH
 KKVoCFwEqr996mOvXzcPlWCwXNFYyyV/5ygPU6Z1oDaXvD2BhDt52Yv7FemZnP+MTz9mDEdY9LA
 /Q+0azSfoqlkNq9p+XQAjGjNZ6H0rv7wXibHftgMRoVfCygoRYr30MzlAZGDpE4SVOIg1nK/+FN
 O0gnXpVwWB6Xdl+SEiF5KUGBrVij12n6DPFPLvO3UwGbAD9M1DaYGCNiPyPRxCp0euJ7XxKueUW
 BOL9JwkKM4YReCHxW0mx97kchGDtINI77myL/zTgM/iCcivKqHXJu/SWZdNUP11KHZfci0rjvbd
 ZC53KLap2ky9CkDoabA==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba7bd6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=cHhBG6FuOey2j-0mYlgA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ATtNgHN5dPMWVsXtij5xPlw9orpQJf_K
X-Proofpoint-ORIG-GUID: ATtNgHN5dPMWVsXtij5xPlw9orpQJf_K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX4xYPKImA+f6h
 KfUp202nYtOAne0FL9+iniCH5X/+l7DRGKJPHkJ7DrNBRXTk2zFNYiQOp/DhFBwWaxSey/GKpw4
 NBt/XuRw7hBM5wmcXfeLowtUPttgVbY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153816_696217_CB47F792 
X-CRM114-Status: GOOD (  20.84  )
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

Add a bus token for MSI domains that remap interrupts, needed by the
upcoming RISC-V IOMMU interrupt-remapping domain to distinguish itself
from NEXUS domains. The token is generic because remapping itself is
the only property that needs to be conveyed -- there is nothing
RISC-V-specific about it.

Such a domain implements init_dev_msi_info() via
msi_parent_init_dev_msi_info(), which leaves 'domain' pointing at the
NEXUS domain while 'real_parent' points at the remap domain itself.
Accept that combination in msi_lib_init_dev_msi_info(); no other
msi-lib changes are needed.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/irqchip/irq-msi-lib.c  | 8 ++++----
 include/linux/irqdomain_defs.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 45e0ed3134ce..9027dfbab15e 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -36,14 +36,14 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		return false;
 
 	/*
-	 * MSI parent domain specific settings. For now there is only the
-	 * root parent domain, e.g. NEXUS, acting as a MSI parent, but it is
-	 * possible to stack MSI parents. See x86 vector -> irq remapping
+	 * MSI parent domain specific settings. There may be only the root
+	 * parent domain, e.g. NEXUS, acting as a MSI parent, or there may
+	 * be stacked MSI parents, typically used for remapping.
 	 */
 	if (domain->bus_token == pops->bus_select_token) {
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
-	} else {
+	} else if (real_parent->bus_token != DOMAIN_BUS_MSI_REMAP) {
 		WARN_ON_ONCE(1);
 		return false;
 	}
diff --git a/include/linux/irqdomain_defs.h b/include/linux/irqdomain_defs.h
index 3a03bdfeeee9..954cf585b3c4 100644
--- a/include/linux/irqdomain_defs.h
+++ b/include/linux/irqdomain_defs.h
@@ -26,6 +26,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_AMDVI,
 	DOMAIN_BUS_DEVICE_MSI,
 	DOMAIN_BUS_WIRED_TO_MSI,
+	DOMAIN_BUS_MSI_REMAP,
 };
 
 #endif /* _LINUX_IRQDOMAIN_DEFS_H */
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
