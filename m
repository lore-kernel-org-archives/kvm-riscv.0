Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1FAC98325
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QQbUEAfObDBY8USkCvnjQU3sbI900xbatST5+W6QsRU=; b=FN4TRMuYAmPsmD
	BuE76A0tExgCh3SPXMhhHpUBYb04WoY4kDMDELLM/o7aIaDrUZFIyPoXmncPtqvtATEwCXcRxWZMI
	aYGWOvr/teajtSyqC/TA1FWwPCYzm1NvFMu5l4GK7X4T1bUr+lcqop/ZNHKBue1yhBVLDDkZL7Tb9
	o0yn0U16nh78eINsAD/xhiPoXPfhDsKiSIYHFaUjFqpoFmcteEjTYiz5Rj/q7glnlrZEEBYzcrKUX
	5GiSgds0DsRNyuHAgi9TRxWUaYxlMxZBf5GIBAte2PeSPqPHRHnUQ/SKD6CpZeIeuxeqO7LQM367y
	YYXdJYIUSNDTv4/hdrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Cx-0000000DrHX-00ZJ;
	Fri, 25 Sep 2026 15:51:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Cv-0000000DrGo-1YAj
	for kvm-riscv@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4EQApj9r2VvF6sDy4NREnewmJKRcfdPjIfogl31Oeao=; b=YJZJ2+VJZHsyjNVpDkQTplHuQJ
	axFG6cY3JjHIy2Kwv6iOU2Mii/3rfRPztzWdMDdp+kVkbxcrS6fahsh4P4snUgz9+Bdt/uuupQg7L
	o/rSDwyM06blQR62JawLfj0OmCFSmdjbSCOPbDn+mRiZzJcKG7/8J7YpKrB0DdEC8lqhgF9eZ8efo
	2bxix307EEQgqc29KRsAD0DnNY4ifEhuPiM2jdwyyO5SYjErKLWJCcIBMFeiWZIb4XHL9yZ2QIhYh
	yauAMTnWY8XhN9OrDucXyHs3fkbwUWih69NoM5i/VR6ohodAdCiuwNF08phAtXTWX2uBeAe+CYwtu
	7jxEz7XQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA8Cs-0000000H5hn-1Y0M
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:51:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PFHZMo2554013
	for <kvm-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4EQApj9r2VvF6sDy4NREnewmJKRcfdPjIfo
	gl31Oeao=; b=RsQkcJLsAmUF2WOEhb0EweNUBr4RJEtO4fwE1g3EbSb0whsZ1wA
	Judwm4Tnle/phQvDBCurK5vRrfqpMEqAXACuAxpUpNEWsElgcUEabj2+YwcgRTa1
	OfjJyryi+tdRpSlsjHVULX2Iga6dg54Q+/+/v0w6ZGPFoTwQobEj08zkGTnzEsw9
	1QhvqT5emLhIl9SppJYVBAP9+BqUKeUM00JhY4PLK+QQyTnJgZ2+q24EeIACsmF1
	AEVYrvdzIXkpXEPLwzSMt/BvdzUTUYoolPiSM47k8Pa+rlK0lBy3o+g9erFhHoau
	nlfp0N+jvXeHqXtx+4LqvbEKf5HLBA2ozfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwufk04dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:51:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso224764985a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351483; x=1790956283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4EQApj9r2VvF6sDy4NREnewmJKRcfdPjIfogl31Oeao=;
        b=BDBkIN2xd5e5jxNuWFVZUHQ+ahnNMfxi+dxmvRnZVUc1j0iLujXK7eWjX2az3bQY6i
         AljiTR7tCr9G//2agQUpxKbnCDUSr+YL8Iyozm+280MXzp3tzugrZyN6xIys8eSKhvYL
         L13Ff+eguXsdeOXML8yLl/TF2WCNpapLo8iJNMkZ82g6cV2oO+FXRrjuV02FO6AViOik
         A2wXt99PUXiOY+N9VlPhPCZeWG2Ze6x+n77bqOk1g8cKwmnjftKjdHzDQ578ozlPH8PU
         MWxt+B5HQCcMU8sQfRLlAXJchj7NWicXm4+N8sCaoSgUbYEKrDcUmsUa1oxPD6Pp/94+
         WuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351483; x=1790956283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EQApj9r2VvF6sDy4NREnewmJKRcfdPjIfogl31Oeao=;
        b=ZrFJSJNIbNMzqgDEjWx66Tw0hd7fWY/Yi6kYnmbauNz43jUyso0OO+5FgbN/a91cq7
         R/6DrbAENBp4NJNWgGYossm54+0d6Kgb2v3Eh1izrymWEW+dBVALUrsa8YwPJo09NPKg
         cTe2LDakosOgMcMN2lez/NyuFTD4/0yQij4H3ff3vpTVnSmHlXtEQ7GRpS+67NKDUsYO
         BZfdfDplDkQJbbNjWg2fGnTYbURiZwRBXDNjiCqbCP8g97QcRCQ2h17Y+4iH8REWsfaj
         utiXFAYdc6oNlP8bbR9KwARlwJHHr0+PnUDnBO8heuiJ3yfD9MpfiuFdyF1V+Q5Od1US
         h+Ug==
X-Gm-Message-State: AFuF++kIvi7pMkb0XwNj37lsfDKvlCnLfqHOBYu6ryJ8CugUlXrm7lAv
	eGiSe41xOrOq0y5xbb+N8PbaZZtNjJS/Av1PEzHNuCihIkPOm2xSjnimB4Y4dFgDC1FZ1oddXeX
	7OchzAL+8VmSsKo3Wx0Yl2jlkofg3xeWD8XfVsvq1vw9Z1iXWWqk1BkeV6tqB/XQrkYFPXJMB2l
	mN
X-Gm-Gg: AYBFou2AizcqnCvdo64fm4N3+lddtGmJWKZJxv+GQMLasvdxJdU5BNf7UEEWO7HRvLL
	spHn0or43/2lsJjxtI8WhdtX5DtiCsOLJvR+d3y+IH9oprQCGKq6X8m5zBaTJ7/MEPDClibjyue
	OaSJmCMOW86fL63mfA5nUvOsIFQWh1sZV+izkWQcIrcaGPPGhkhzxb7sK8XRKi636x3XqAPAR4r
	hJ41OF18NrQDVanlNc7zetXqXR5zMJLSkEwEScIfxnoxDiRyf3CHthY6yaUKKveAauS6cQzeF93
	l8G+QwYyu0E9WzezPgV6hH0O/kTf4/EWtzN9WyZbIpcXP/Com4nrtf7X+sYvJ5V0H52ZP6v6vYf
	yfT4nB/tnIo13Q6VSzFtALu2qh7uMVQScUI2umg==
X-Received: by 2002:a05:620a:1724:b0:939:72cb:bae5 with SMTP id af79cd13be357-93c43d6c35amr489398985a.28.1790351478198;
        Fri, 25 Sep 2026 08:51:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:939:72cb:bae5 with SMTP id af79cd13be357-93c43d6c35amr489395285a.28.1790351477616;
        Fri, 25 Sep 2026 08:51:17 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60cc72sm49048745e9.3.2026.09.25.08.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:51:16 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: kvm-riscv@lists.infradead.org
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
        palmer@dabbelt.com, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
Date: Fri, 25 Sep 2026 17:51:16 +0200
Message-ID: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: 96JsyyW8KTZ-p83sLSLsq-2ygoM2LWb4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX7oYpB3Oyh3ak
 5QQTJXIrlOVbSzymb2vb/Haaxq01w1y1QBqtL3LE/r+8YbqNW+lIJhTr+yBBPoRVjhMFOkWDwqy
 3G1B+HnyXro6Sosl8ZWHKjHKnWgbjBE=
X-Proofpoint-ORIG-GUID: 96JsyyW8KTZ-p83sLSLsq-2ygoM2LWb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX7lpIQaDNgbdH
 5/9J4YD8YKhtRUZGwYV8y8CBDyrEisa47CHIcxYE8gWhC3/i2zQezB5VrXOpCk6fBk0Xp91oU1E
 RFVbncG/19ek5oIZfadzcBSFXWa+XDnufsBEHLtMhTFka5gKUriUXyjeuyBMUGZljG0+nh5J9jQ
 m6wSQYmby9ZMSIUbYVFgVrlYZFQRWwT7FeyH8/6hazGHC0B8D+l2iHPzsMqaxBcNstG5Sf5P9O6
 uBWI1ht3ttDPgzMGh8W74cK8WHb41M4KY/tWLCtiihObaB+DkBO++H9+233ldlTnACi7H+tOkKz
 xo+ITmSs1wzzhdpLLdH58JuQyiU7ZlZrVMLZAAHHe1q6kLOheXu/1tkWkXoi+NGBAf23eHxGL80
 ufY7jfQDsf89Tsqyh0l5W7+pb525awd7tDKslNN4E502oryRbyd/iFFxHU0pZpcV06Id2R43YJw
 ffPGEm6RVzgFj8JTkDg==
X-Authority-Analysis: v=2.4 cv=B+wsQ+tM c=1 sm=1 tr=0 ts=6ab6987c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vaztLdeRwP-UqatcU2kA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_165126_795886_801BC022 
X-CRM114-Status: GOOD (  16.20  )
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

kvm_riscv_vcpu_aia_imsic_put() can run from the scheduler preemption
notifier while the raw runqueue lock is held. Taking vsfile_lock, an
rwlock_t, there violates the lockdep wait-context rules.

Protect the CPU/HGEI pair with a separate raw spinlock. All updates to
that pair retain vsfile_lock and take the new lock, while scheduler-out
uses only the new lock around the HGEIE update. This keeps the wakeup
setup serialized with VS-file publication and release without bringing
wider IMSIC operations into a raw critical section.

Fixes: 4cec89db80ba ("RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization")
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/kvm/aia_imsic.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index c1af23e79ae0..1ccb7eac9f45 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -48,6 +48,8 @@ struct imsic {
 
 	/* IMSIC VS-file */
 	rwlock_t vsfile_lock;
+	/* Writers hold both locks; scheduler-out only takes hgei_lock. */
+	raw_spinlock_t hgei_lock;
 	int vsfile_cpu;
 	int vsfile_hgei;
 	void __iomem *vsfile_va;
@@ -582,6 +584,17 @@ static void imsic_vsfile_local_update(int vsfile_hgei, u32 nr_eix,
 	csr_write(CSR_VSISELECT, old_vsiselect);
 }
 
+static void imsic_vsfile_set_hgei(struct imsic *imsic, int cpu, int hgei)
+{
+	unsigned long flags;
+
+	/* Serialize the CPU/HGEI pair with scheduler-out's wakeup setup. */
+	raw_spin_lock_irqsave(&imsic->hgei_lock, flags);
+	imsic->vsfile_cpu = cpu;
+	imsic->vsfile_hgei = hgei;
+	raw_spin_unlock_irqrestore(&imsic->hgei_lock, flags);
+}
+
 static void imsic_vsfile_cleanup(struct imsic *imsic)
 {
 	int old_vsfile_hgei, old_vsfile_cpu;
@@ -596,7 +609,7 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
-	imsic->vsfile_cpu = imsic->vsfile_hgei = -1;
+	imsic_vsfile_set_hgei(imsic, -1, -1);
 	imsic->vsfile_va = NULL;
 	imsic->vsfile_pa = 0;
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
@@ -727,10 +740,10 @@ void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu)
 	if (!kvm_vcpu_is_blocking(vcpu))
 		return;
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->hgei_lock, flags);
 	if (imsic->vsfile_cpu > -1)
 		csr_set(CSR_HGEIE, BIT(imsic->vsfile_hgei));
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->hgei_lock, flags);
 }
 
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
@@ -747,7 +760,7 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
-	imsic->vsfile_cpu = imsic->vsfile_hgei = -1;
+	imsic_vsfile_set_hgei(imsic, -1, -1);
 	imsic->vsfile_va = NULL;
 	imsic->vsfile_pa = 0;
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
@@ -861,8 +874,7 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 
 	/* Update new IMSIC VS-file details in IMSIC context */
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
-	imsic->vsfile_hgei = new_vsfile_hgei;
-	imsic->vsfile_cpu = vcpu->cpu;
+	imsic_vsfile_set_hgei(imsic, vcpu->cpu, new_vsfile_hgei);
 	imsic->vsfile_va = new_vsfile_va;
 	imsic->vsfile_pa = new_vsfile_pa;
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
@@ -1112,6 +1124,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 	/* Setup IMSIC context  */
 	imsic->nr_msis = kvm->arch.aia.nr_ids + 1;
 	rwlock_init(&imsic->vsfile_lock);
+	raw_spin_lock_init(&imsic->hgei_lock);
 	imsic->nr_eix = BITS_TO_U64(imsic->nr_msis);
 	imsic->nr_hw_eix = BITS_TO_U64(kvm_riscv_aia_max_ids);
 	imsic->vsfile_hgei = imsic->vsfile_cpu = -1;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
