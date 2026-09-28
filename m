Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCCCCA5FA5
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9Av4ofXJ1OVMhBQtUo1xq7jTz5swh9Xt6JrDHR78OQ=; b=leS9UTPPrGgMaP
	DNB+l6aQiKTy6kZ91GNqdtITH1UXtJHgnjmhFo8IDKxdEECCySelW7KgW/W9Avg9xc7Py+gbTEMDB
	Go5wy5sVwPdK+NmHNdXa4VcjSTpjefAEtEFCEQ8FD3skczRJsSnCuqiw4oTUmucPlAzKqHFeLt9a6
	g1LLED9KGeUOYnMi517zZU8/orpA3914/38HDykLDwKFMzKlnkOT/QgCsDm9kWNjgIFu/+0eSFY20
	FzLKILfm7AMp0EzADH0y/bqUEa2wIneK2At9qOfsujtVy8r6JvDzIBA5c8XQd2PngzIRI3XqN1v5q
	h/Elv4MMWscvtazFCi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVQ-00000000nA3-3HvC;
	Mon, 28 Sep 2026 14:39:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCVP-00000000n9K-0ve3
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:39:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAZiP558813
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qxLv+wRWUPQ
	akyE8xOuZTAbdosP4MYCeK2FTsiU2BFI=; b=PhsmkViQJCQemOPtl3iSwfqxLSx
	H1fsXQFhaw0QaJgQtyvDTJgSLVVQuvDwsotMKk2pwtHckkciUEGML0xfKcPf98Wp
	vin8jKqi1SaP3eleGdOEg7yBW5QbMfx7RF+6LAzz/jgrPP/GPEPtVaDOS9ztH4Tv
	Oc0Jh4N4HkqvGf+tQV6HRr8Fr2WrrUVzV+N3FFwOGYpg25m09BYu/iyOM49vJfdX
	VepGC9OC6VN1I5a7UxNpNlab3ygBmiSIrbtw/zbYKGyKNusJj+NdOWILbS+hVQmF
	t3OrWlUdMCKh/SwOazWzwIoNyuHMOHjZJvuMPy3K9+N+QE8cTGWzVdm4HLw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq2m1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:58 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5cd0c08d264so3168420e0c.3
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606337; x=1791211137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxLv+wRWUPQakyE8xOuZTAbdosP4MYCeK2FTsiU2BFI=;
        b=DPBcdr8V2JsF5tK+k2msjsvEmPybNoHZru96u8QDBbGhD9+PGVCoPpEPZJldzuuRUf
         UyoYXAFWu9Ov1nNCCqbKKzxhwEVjYOBMOkqhF2+fbrAuovHtzaaiWnJz4gWjFiJ4JkSh
         UQzXVFSSh05/VuuB1le2xertWvJ6ZmzwStuLPI2iRdtEAX+lztmZO1R9N7tclOA+UWUO
         nifN/9/71KBinQiabC9Cmu0w0VUjA7JT50C54pIRLTzlpu0gtyWabD6e+O+Q3AUDf5oz
         u4nPE9DuJZtggjBu+wZZdkJQvb9ZW6bZjF40xi0Nyz++HLj4ITKAUi2Hza0XxO3zsq8r
         hjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606337; x=1791211137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qxLv+wRWUPQakyE8xOuZTAbdosP4MYCeK2FTsiU2BFI=;
        b=1IIRwmJDQe3LPAg7JPgBwZpZXMSC7KU4n1a9xMo26qPG+kH0/cDcg5Pap14ShUWMBN
         YI0ixyBQr1SjY+Zia9AKi5oRZhMsuNofc7RDZVXVOCuwkXUuHNo0AuATP5nZQy+3dmZV
         28kvbXH0pJ7CwIj9yP24QyVM6DF7jAfHDQ9dZsMQKibKNcnVpnx0sKoYnvgdtlLT8U7X
         Sa+3fyEvUQthoEkyIaiJetxouAoloF3pClL+ezb5meCOeGAgB6/l/JY5prNdEUliU4Zt
         cHAeDHK5j9ctFxddR54V6qLqL1d3zrjAzuVJ3XmmTF4Iar9evvnqZoT1iSBTSH9y7oRr
         hj4A==
X-Forwarded-Encrypted: i=1; AKwUvByW1124QAdX+dDevakEFys22yjdK34T1kXyrmMJZ1ja/pW4By/wNaPhx4AnQ+5Vb9xP9nGqoNVG16U=@lists.infradead.org
X-Gm-Message-State: AFq9FYL46EXkjsaGRVxlOzuTCpkBOIkVdPzzIkYZXLc6mFUTtVngTrCI
	fItQs2KlMajuPJHy8Zjk+T5052IgONb5HfCKiP025BbuVXZ4t+j6TQXvKdQozekwFVt4xvWig+a
	sil9INQDp/+hijRVTRrtWbEOHkGVFmsrU010xCXZmzZypQxPeslINvkhzaB7g5AT1mq/ySmeiHO
	BL
X-Gm-Gg: AYBFou0wOaqkuqkxOBqH4pmzVbWTefS/cf6V8/jtos2nXTfS7bRgEGan2BbjZplfvsc
	BxKF4Lbj7WQSCzOml2LB3o0FtaDNUwNRjINSLYjVF8l1iNaBq7mbIkJjelO3szDsvWVtXEtOEul
	dziwDJFsH5ZpJjz8b5JPxNGpRLH+bwALjAfsahAGQhNZEXCGRizqvKQYIOQ16h5eY4lxwgn7ZCT
	20bnWQTHIv2eY9CXUjL11Oq3Sc97d8uwdZgAj109JtkChyFLG6YjsKwYYBGqVqDvFa/hFmU3xvp
	azwLJC4UhKvgbI/C3jK16PxecPMl7gSf0T3ALAayEFge9uhTdJvxPkJuNOfRoTLjvGPk46jyDq2
	CjGseUMU/RmomPlpfUtWM86TQ4WSDZCtofVNIzA==
X-Received: by 2002:a05:6122:3b89:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5cb0adb0e2dmr6314615e0c.19.1790606337463;
        Mon, 28 Sep 2026 07:38:57 -0700 (PDT)
X-Received: by 2002:a05:6102:32d0:b0:7b2:7aac:8ccf with SMTP id ada2fe7eead31-7b27aac8d4bmr3265770137.29.1790605900321;
        Mon, 28 Sep 2026 07:31:40 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaecf2f62esm4040194a12.27.2026.09.28.07.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:39 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 04/14] iommu/riscv: Reject live S2 replacement with forwarded IRQs
Date: Mon, 28 Sep 2026 16:31:03 +0200
Message-ID: <20260928143113.49838-5-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: A1pHBNFe2I18UhlnKUPb9LbTcVBCPqf4
X-Proofpoint-GUID: A1pHBNFe2I18UhlnKUPb9LbTcVBCPqf4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX53Uia+xFWcIC
 y7cXVX823/aQ6caoK+efuXljhQ0T0/mknD+TPeyiBqdhx3BrM22RQzuXFDty6uVQqDLsWQEiWsT
 5zVwgVmfFJTMoRBPp+NJXzd79O6LJUA=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba7c02 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=t97w11WlQ40Dee02AfYA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX9PnVRkP3WoD3
 bNYOxeNzmLKVgL7Z8kaiku8CppapPWfp7GFNje0U5a8hqyGXojH1WNmKj71lHU6LtmmgaFjPzc+
 T1+IgnqibeQ5O+G6EKbjG1bDYaWMB3zOspKI7iJaLtl09hZ89EJwqgzXcT4AdazbaoqAIjGNTl7
 gQMHDDnVnriOvwOkp7HeQtK+NVyNnAclrhfniAJBsNPOviDQOYi+soYcdmN2VgUs/zRhe+/K9eB
 iBNSavus86pnWEOMtzA83skRtBVEMXSzxyhFZVImr/MkqnyijODdiYmmbflG7KJwOzbEzPx4OYg
 COPRPpgsLYE8vXvJM5794urmUNSbNuBNK3VVaIrDByRxOyOXnXv+Uxo6V21kGcTgncAOG/2bXy/
 nE7UDURTd0I2+rm+LX0cnAyZvw2lRlKSPIiyZcfjZ7hSF/z1DcBlsO+ilUPKHdVtlufO3zbDS3Y
 1RPGwbOm16FgdnfVRXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073859_260053_75AF44E4 
X-CRM114-Status: GOOD (  16.85  )
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

MSI forwarding state is tied to the S2 domain MSI table. Replacing a
device's S2 domain while one of its IRQs is forwarded would leave the
IRQ state referring to the detached table.

Reject direct S2-to-S2 replacement when the moving device has forwarded
IRQs. Introduce a per-device nr_forwarded_irqs counter, rather than
domain-wide accounting, so other devices in the same IOMMU group can
still move and can be rolled back if a later device fails.

Later patches which introduce interrupt remapping support will manage
the newly introduced nr_forwarded_irqs counter.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 57f2884dec42..d48667112cd9 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -872,6 +872,7 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
 	struct riscv_iommu_domain *domain;
+	unsigned int nr_forwarded_irqs;
 };
 
 static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
@@ -1432,6 +1433,36 @@ static int riscv_iommu_msi_table_alloc(struct riscv_iommu_domain *domain,
 	return 0;
 }
 
+static bool riscv_iommu_can_attach_paging_domain(struct iommu_domain *iommu_domain,
+						 struct device *dev,
+						 struct iommu_domain *old)
+{
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	bool new_is_s2 = domain->gscid;
+	struct riscv_iommu_msi_table *new_msi_table, *old_msi_table;
+
+	if (iommu_domain == old)
+		return true;
+
+	new_msi_table = riscv_iommu_domain_msi_table(iommu_domain);
+	old_msi_table = riscv_iommu_domain_msi_table(old);
+
+	if (new_msi_table)
+		lockdep_assert_held(&new_msi_table->lock);
+	if (old_msi_table)
+		lockdep_assert_held(&old_msi_table->lock);
+
+	/*
+	 * Per-device accounting allows other devices in the same IOMMU group
+	 * to move or roll back while this device has forwarded interrupts.
+	 */
+	if (new_is_s2 && old_msi_table && info->nr_forwarded_irqs)
+		return false;
+
+	return true;
+}
+
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 					    struct device *dev,
 					    struct iommu_domain *old)
@@ -1477,6 +1508,11 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	bond->dev = dev;
 
 	flags = riscv_iommu_msi_tables_lock(old, iommu_domain);
+	if (!riscv_iommu_can_attach_paging_domain(iommu_domain, dev, old)) {
+		riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
+		kfree(bond);
+		return -EBUSY;
+	}
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
