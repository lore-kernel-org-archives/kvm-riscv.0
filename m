Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED74CD5BC8
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 May 2026 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eQLOfNPdClaX+rPmakL9cmz6qteQVQXnbjjNFdvj6uE=; b=HzzRTN/HKy43Sa
	hltnNlYXfeQCGTl6wqGJzNgRNh+J5+E2wrulvew6Fjwsr01Vo7aqk4YGJ9V9mYxQCkIZl1rZcx8IW
	4/UzU3IZzeOK7q39YqMCM8+FCm7XLa1W8qyQW/f1M2CBkac0nr9L/TPLbzBKZd4aMBBcs2BxESD2b
	vEBFl8DFkyCG1ZtWfq/yYfzHHv/nCPvJ1gxyTTq/EBVs9Ak0R1/fgpMg0VQyWlkGGUXxMFpnfZf5x
	Kp4a1ddABGzAlihN7RY6Lbk1qX4IntucJdqBcJvgo5TN2Foo1tJx6AdgeX2kH0YM32/7ocOknJG89
	RUrzWbAIChDszygln7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRS6A-0000000Gtj9-2Mrz;
	Mon, 25 May 2026 09:59:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRS67-0000000Gtic-3JNz
	for kvm-riscv@lists.infradead.org;
	Mon, 25 May 2026 09:59:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9EdD5079559
	for <kvm-riscv@lists.infradead.org>; Mon, 25 May 2026 09:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3/gvsRa9rAHCNHfljIYQFKolUiZ0vZQ20gw
	HqqZu+wY=; b=dmK7uSQGA+xzlJvOD6xix17u2lbxkjd1glYwe3lhU6B2ShhJBrG
	w9hsUI92oJ2lV10TRAEo3jzDTZw52bp67jwlSZwIxZDxUo8JCgiebPPNmMRgNYkA
	QAoSdwDp2bv0Cq6C+jQ2403A/sMdeffcX5jzrDiaYySAEFf7xgJNM8tok/p/0mR9
	cLSxvKLrnEFyqeZRtDb/BMiGYBrG9x7OLrXyPqmtGJqAbyKgRIBbpMFCdAwCX97K
	L1fLdSixnpTBM6NBPJytyqaJUbeOo1I825evf00sHOnGnjircyt3nR61AB1lTXem
	q7I/WYgk/cgAZhcieImyj6MmVkbifXac6Zw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma861e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 25 May 2026 09:59:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83836443305so4572449b3a.1
        for <kvm-riscv@lists.infradead.org>; Mon, 25 May 2026 02:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703186; x=1780307986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/gvsRa9rAHCNHfljIYQFKolUiZ0vZQ20gwHqqZu+wY=;
        b=IdvlU9NWcWbOWK6gIy066Nicnft/2X4bG2vlv1fsFtXzFbCBucppBXg79bEJ4h+bVL
         00C1IKFwJiggomKVTa+qgRAsQJw8FYxKNwqOk8hhh0FzjCIJVl0BzCLO5Qgi9KaScE3u
         DrTKmRK3b6ge/kflD31plf1LDf2JqwE8jXTNsytZVqxUntaKpzB/BzurL9dsRJGyZqiG
         bkqeGHAYYc99alPwRQ2EfG44Z4Ug3UiERHQNLEK7Ws2bD17lgmn+Lv5TM+zkRk0kewgy
         YU7SMqidusnS0Sx2wzj0ZFEH8lXx17KSQrqe3dqB0MxE7n0YYNLVqyMV0w2GS2xUvql9
         FALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703186; x=1780307986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/gvsRa9rAHCNHfljIYQFKolUiZ0vZQ20gwHqqZu+wY=;
        b=ZO6q6hN5suO1wSLf1cWznLjTIXcjrR+1wOxZqkekerHTLTizSYtTJtuVzvEYonA8TX
         BVoqmSDCl/L3od4yauF8jzH0vPy4TR6i6vLGgwZbQC7ls3zMmUp9zFq7zQZMTYinu2pQ
         cRd3iZuXU8g4xdHl7oCx56/vnrVoZJYQAnRtM+QyNdngrm+dfdlyXED2Y2TT+04nzRj3
         mSL336n99B8i9QIV0cQyxc5P3w9bHftCentEr257oliN8x/wLt3q9xy5IwhG89HgehKL
         t+HL6Of2vu4VjO3Jzg7Gm2HuVUxzs84T0yYkt1tuw+aYD5kFyYS5f2VXeAR4WAFDtQZm
         Cgzg==
X-Forwarded-Encrypted: i=1; AFNElJ91Sx2soUejKFd7HlhILzNP4zFkmuQoCOp1HcCk9Fi9+4oyLecDlNvssJXBQz2bu47zlZ/7jrzkJXc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSX+JjOsDmGfivBa2e1WDuD7kluDrJqWgQYZMXBO4BxAmLuQI+
	se/pD1BOmYf3UiQZ4LCMX/B+/O2TUKmSjdVyn16uYKGnZVuoYQny+GQ2jiXwiRn8xmy47eBY68l
	DGyIcUelePx0tA0JHnzLB8SeFx6QOjWHsKx5CH48vow/1xCOCIJXNx7w/qoFCXfSjk6ff
X-Gm-Gg: Acq92OGLnsamvOemnD2QOP1yUrpe1t7HWvpCz95boS1lbH2dfY9FWZr913Ol2xL8tJ7
	N2f7+UWApcbAY5wtEcHsC9lQaTr+Cl5V/G8AIIcIMpENESNRHTmeEn4eYjK9ZK+kCTH3F/tpDDD
	7uSOHiGFzPeivg2QPe0wBH9qBcnhmiWXKx3hKpiTZRZmqR8hkEgEhAU1yLF+MZlXgeg4PNdWWTv
	mtSN5Or2mRAkoH+4KYcn0Flu4e8AS8t11mRhbz8YNt0DgbLBwBvCd/4jZ8vg/sKzfDZaNDx6vl/
	6e8wC0gFybDyClWg8PY9Kk109AcBDDNQKaZX2y5yhMpzLhiZ9NCUCeSNh/c5FyHwbDZ44No/jv2
	nMQWxKNSDT/uVA96tzvryy8vL1OsZNc6LNg+eatsrluNhixwCF3ndcR1YZGvGu46Y+I8L4iSn76
	U3NmjAtXA4NCpirKNYk/zyQpJF+3QpuWjDOZM+mFnAC3nBJcY=
X-Received: by 2002:a05:6a00:8c12:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8415f32e8c8mr13624181b3a.27.1779703185546;
        Mon, 25 May 2026 02:59:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c12:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8415f32e8c8mr13624123b3a.27.1779703184887;
        Mon, 25 May 2026 02:59:44 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84164e9e635sm10019260b3a.38.2026.05.25.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:59:44 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Fix ebreak self test failure
Date: Mon, 25 May 2026 15:29:28 +0530
Message-ID: <20260525095930.3924905-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a141d92 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=H_xIGRXdBt4bEJCxPLsA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: xryIoxX1NsOLeGm601yPOpnpm1ajKwIP
X-Proofpoint-GUID: xryIoxX1NsOLeGm601yPOpnpm1ajKwIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMSBTYWx0ZWRfX5P/8867qcnz3
 HBWQAbIoNV1We2Vv/ORy1Uyq1TX1rH6FTKd1m7FDCHzJfFvKtPc4FvHBtTlDn9akPpfYkvUTgT1
 j0g5tO/CPaI4/hZM9YORRnaHTb1JcJHtEG6RU48tV9jLRSommqKu+CCHK8SBBvcK7WmsvjHKO9O
 1Yc5BW1DjnEilDA/87bVT/UujzxbSNZrrwCh0HQIRm8beg0jRgeUuu2QKteGfkUxljin9fiJXQT
 c2ZOtDUkA4DT4g6BFa0kXgcoZ6+/1tW0MSuFxuE7+VJzVJ5AvlrQzL2gkbGlKozinauwHxC09Yr
 vRlsfV+VC2K5AuMAEEilSVHM9Phd1KKM+hi+kNt3YKFUsv46usdIWMimseRIDhMKiV1AVUqWSaI
 ZcX0aIeYYeaKUcUf9p9+/ZE5JsxUZ0r5d654BF4M+extFDqDVZ3Vk0aZqG3VFjq9mIxlYMAgz6Q
 uhKlBUDuk4KR83IPlGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_025947_835958_C7173A05 
X-CRM114-Status: GOOD (  10.49  )
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

The ebreak self test enables/disables guest debugging as a part of the
test. However the KVM_SET_GUEST_DEBUG ioctl doesn't actually do it.
Fixing it by calling kvm_riscv_vcpu_config_guest_debug.

Fixes: 6ed523e2b612 ("RISC-V: KVM: Factor-out VCPU config into separate sources")
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 arch/riscv/kvm/vcpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a73690eda84b..cf6e231e76e2 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -538,6 +538,7 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 	else
 		vcpu->guest_debug = 0;
 
+	kvm_riscv_vcpu_config_guest_debug(vcpu);
 	return 0;
 }
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
