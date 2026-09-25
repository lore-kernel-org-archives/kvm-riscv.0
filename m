Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18148C9830E
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0/LFg+DEGAB4yPknQy3/xAnxpJXkTDDBsEbYiAEbbxo=; b=KrPf41rCo02pAb
	8yLnXjaTmWmHp6+/Dwbzs4ff2UqrfT4a76jivd5hsuSayt3ENNpZ5BD5dPIusVnqyPd6y23Z+Doy+
	ro0q1Oldh8CRi8l7lVYv/YB/zWMI/4HP8cqNbsECXy57/63S9i0bw4YwXv47bA/XCX/REMQ/1ZqRr
	PSPufRo94Z+mQ3hH75e0yr+oRheyEe21V0bAKpFnVG0CTLAuzYXAamCla4vtFMBTXZZ2TCR/pCpMw
	nF1ryF/AXDpjxTTcyaXc4iNaOo/V+NEoqLd38oQVNQd3/exSbHhtjCCnm86g2/a+PkxGNQmkPTh1J
	+jLh9ljJjdiKoM9sEm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8OA-0000000Dtaw-2urL;
	Fri, 25 Sep 2026 16:03:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8O8-0000000Dta0-1Oge
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 16:03:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0ave170087
	for <kvm-riscv@lists.infradead.org>; Fri, 25 Sep 2026 16:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pPUscgiiGEE2Ts6w5N0M5vrxQHmauRrDTsR
	QpGYB8bo=; b=CHIwSdtj/Lo9jqq+QUDkDZGz5er9nK0n/ommKXcOJ3ouoxXBwYZ
	GJFYPJoqGOOQVQY3Ck5zZR0Oe3H5c4P3ZPwA8DgCCts3xY2kyJ2DM2XwL+hCT3vs
	+huoMoGs3NEoGKPtvOUpsHUHgZlXKxnJYhiBajxGYaeWKSaQSisInxkFX/MduxQX
	zoIyo8LGTCLBKBDRI9Q9gKyeAXglMOdn2BFrFeXUOJAsROkDUjY+SUYJSHNP0V/I
	ZAqqvSBAev5cV/NXqOltAuw/MHUKNha2o2n2lAKVgWjEFaLH5hvSSiN3TZEeSQiH
	W6RwmnYSLQfAFYAnoSAaD5yKdTqfZ6tbw3g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm529na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 25 Sep 2026 16:03:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b32f32d879so207110137.1
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Sep 2026 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352183; x=1790956983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPUscgiiGEE2Ts6w5N0M5vrxQHmauRrDTsRQpGYB8bo=;
        b=R4U6K5kPacy3sq8HM9UqLF9bGJTmiS4pgDyUvM2jaieh57CwMJXUlbkWZhZkHtXMeA
         tXYzlTenaaxwWug4m0c8LmeEC/UX8ZcEss2hICF+O9GZncZkSvJagjdAsR9Xs2yIdX//
         /8JIr2UN4oU4Fil7NVD1eRst2kRiVguZA7NHSZqfXmvGycSijD5pmlcrr50wpigp6cRU
         AXCVL84MHwKToiD0PW2WI+rrS+wlegs5r6yd4aSP7par2lfuL8tUAATNJTc7rZ9P4mH3
         tUIZyBc8POVOHsQV1mYYDfBOZTRMmlXAnbjhDfXjQ14TvAOrDRnZFJ6N7A8dPjf3c5wF
         jBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352183; x=1790956983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPUscgiiGEE2Ts6w5N0M5vrxQHmauRrDTsRQpGYB8bo=;
        b=QjEklG39ZZGCk48nWg3foWeotDiymaeZ/eYlNq6ntyxsvQMRQvSF1nTiKztXD+bebS
         U0IAbTmIryIfaf/CGvJJb0a3uChyLJ0GpAHNn7jvEgAqzZAXdrD8NUZo9h1ed7u+/evO
         2zy2LMB7JlGzJzqFlODzqqJOOcsD+8jW+IUBIqPp/0TBNj5gW38/+4UZw+OMH/6dqojM
         z2lGjHMKkRt3pYNT7N5yZvfjbWuyWMo/d6QhYrsxR6l5U+YrE7Rr2tg9sXqhYcTCw5LP
         bmKJRjttB4bU0zljDGPbm06wqIz9Ozg5RAMdqXTKxDdh0yQPn+UobQwyZg/Gpb4dSroB
         5xmg==
X-Gm-Message-State: AFuF++mcphOTzJoySywcofkr5WUyR8W+yFVm57hyYeZJvDX3v9/9ZCYV
	cylDgGfxj9UM+9XSl0uusugNT6lnZ6bSyF2LtDwo6rsUl7zAOxAe5pjGQdg/UBvmuaxCfY0UVdk
	9JtkDJm8BeqYoaT0//I27UG+epQBw565RmaREFFi33kjJDxct8DvUf+upS8C7lX17zOcMF7Cnk8
	kX
X-Gm-Gg: AYBFou1hq+V/McvFifEO1tnyAcywMP4Kc6gV8U2RU6SN3mwIoLMAco7Tpw30oXqTiaD
	rrZJGTAJbQB3qOAq5gf/gF8qRK79dxljTY2Ftac4ElpK4I9ImRuZNh6dGi47rpyfr7I9HdFrqWO
	zT1Kq061pjPNeUkGQXI4idhuzru10OMvTjyGtmGko81P3gCVieIr1qmJW5Psc67lTdXEpnjPZwd
	yk0WQAJMxHh4sLlJrFOCuXDTI7+iWiBDtQmxSSRILSjqRKoB6PjNLH7HJXslp6zumyy7SR9qUMs
	X5913lITq8PkDYWCXcWo81QT3BXvjx62wIRyuu6ZxrmLgevn8IVBX+4YRkLua+ugkYKyISBFkzV
	drJNRDxHnXDVetrkIKML2IRA+DN7uzRxXQSi2gA==
X-Received: by 2002:a67:ef82:0:b0:7a7:69a1:add2 with SMTP id ada2fe7eead31-7af1f1fd553mr1987016137.30.1790352182767;
        Fri, 25 Sep 2026 09:03:02 -0700 (PDT)
X-Received: by 2002:a67:ef82:0:b0:7a7:69a1:add2 with SMTP id ada2fe7eead31-7af1f1fd553mr1986990137.30.1790352182076;
        Fri, 25 Sep 2026 09:03:02 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm8151098f8f.36.2026.09.25.09.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:03:01 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: kvm-riscv@lists.infradead.org
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
        palmer@dabbelt.com, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Reject vCPU creation after AIA initialization
Date: Fri, 25 Sep 2026 18:03:00 +0200
Message-ID: <20260925160300.467884-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: P2AyetvUI6IuKyhrcp5qt7D2r00tljmF
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab69b37 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=9vyTzsUqMagNZt02PzcA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX3G+Db/PoOgew
 i3knS9Hgl7XbUn7ui6yxzPKYF9so7At+MIgaX1AAYhjPfqWw8PbOiIiqj/ugxRWGCd+N2/gh4SI
 eXA+VXRkULzaUTB72EbzIkZBUQE/0QhbSZ5c26oL35b4J1kjEJTwLqCoiyGLALPUReXjoePAbxD
 0n09anowiKgu/kVds6hdKCIqaG1WXIHR0Pr7EdBFoPef9p44kbzEBJZ+g3rmhdcHdyUezuoxwlt
 XK9lm52N3joI6svljn37F+m4prsUZQzUNHgeHCeqFiT0+EVrKD8nehas2GO1vYH4VlxpzmDmbx+
 SSdFxai9r5cYoe+4jqmrjUMp2Sm7/Om2MIN88owyCD/n3Yswau8O5wvWw+sYU7s/bZGnv+K+Eef
 VhyUmv0XfkotrLZkeG9yNRGQ0RHvpt5BYTxU7i0SlkchTseWILCgyhT/i91kmZp8Uzahc/tuMWy
 INHjC+jz5nhZ90pYwEA==
X-Proofpoint-ORIG-GUID: P2AyetvUI6IuKyhrcp5qt7D2r00tljmF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX8ZEYkNyFSM/y
 Vqg8oFySDoA4AezZDGTMmL74Asr01SwhoziPr3NeQdYXIlMayg0f4aZGVHJZLycsf12/Ab8OVFl
 1HCTfSX/thxmk9CieAoL644SYVEXHug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_090304_375647_C2F6F4B0 
X-CRM114-Status: GOOD (  12.23  )
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

AIA initialization sets up per-vCPU IMSIC state by iterating over all
online vCPUs. Creating another vCPU afterwards leaves it without
initialized IMSIC state, but KVM currently permits that sequence.

Reject KVM_CREATE_VCPU once AIA initialization succeeds. Both paths are
serialized by kvm->lock, so checking the initialized state from
kvm_arch_vcpu_precreate() freezes the vCPU set used by AIA.

Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irqchip")
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/kvm/vcpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e062ca19f9d8..ccf2def834f1 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -138,6 +138,9 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu, bool kvm_sbi_reset)
 
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 {
+	if (kvm_riscv_aia_initialized(kvm))
+		return -EBUSY;
+
 	return 0;
 }
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
