Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA33ECD9B8
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNhU3FpONBEk1CkUWJNG5Asci1xnuAPfwiCoWuWmqfY=; b=BSc1avKOMeEiaA
	ILvmb9F0s2ibpoZKgLHmTZ7uOHNqIJKCvgn2LbSI6UeeVC0Tfo1QChY4nDx5vu/oeMgYZ7evl2/cV
	8qIZ8CRvNHgG8akMknKcudGyDH8iMB8y1OgYKzbNCmZQ3gJQRjmX7OUUxsu9eNC3kMDwDkS/pKOdq
	EmJxyGWgfYjM6k019c0ys8dSCGVtpuSLBZ2TDBRu+BmpqwBxQll3lMUofOEOvNYzCQJh5KgrLXfRC
	Gf4eiQqeoFLNGIGxLoO2d4HSHo1UoCaeiIwnSBb94ujHHYJA5Ifzu8cb84llf9WOGnZmm/Nrsgkk9
	g2d4Qa7lZX3zWjwvJhpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dl-0000000AdzH-2ST5;
	Fri, 06 Feb 2026 00:24:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dj-0000000Adwh-22Sv
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615JZCMq3077415
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=khQx4CnsxrI
	KfW3vEXmfF4aXf0Jm31HPz3k9tr+YE8w=; b=PpX1Y8rD9eCF+HPoploepd+UF1f
	cY0MLRNcqfLL+8T6C1IMkKvwqzLGVaELpX8hmiFfQGQ2pwytDZlB32/aRXxmLwDM
	Bc0h1e4DYg59rW2qlxhgICN9n6O9OkarS48OOTJ5BB7/ChFM4HgvSfNtkA9TdWZW
	ayH1rccBJUbroPN2YtFDN5XzX8SH5+lyGP9c/IcdXwUgNlzl1L8/3uxJ5X5pPGH2
	NlRiGxLl5IOtFuFDPv9PdkZelEIkjiN7/JDwPULc+DMqj5ng3M8YWWKaH6GxdLDn
	qXj62R4SYSmiJkvlIOAgRjfU3LgUT9d6GAmst+vnZ0jBhf11DPpsAzdFGbg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0t2dpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b8295e5703so10115931eec.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337442; x=1770942242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khQx4CnsxrIKfW3vEXmfF4aXf0Jm31HPz3k9tr+YE8w=;
        b=crqb6RSYPIcmRXaIRhBWkL9pCsBHKP+9pBLNiCPkxZkN4nYRiMoY5IKk00d21mpICV
         bgA7EzIyGYClfdB3rF4HqAaKbJslVy1UPZXN2Fvqol+oFu6uepZmHyXQSdtq90eECyjp
         Fwhf1DFrVzmppPbCHn52lHEfsrGcqm/0tAPZCj3mjdk1DRPJnNrBAjEZEUZg7FmGY9WP
         MNUnNSWReA7CpzxHW9pVs0lIWPPhOcqOav4DFl8styNRNSzHKdAGwDtXu2PybAMFlxJt
         UqOb0e4ZA1LQZRqo67XMcGVdhdInVLOlNhqFoFxGuc6r9Yp1Ll8pj07rE1+mUH2n3zaf
         dMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337442; x=1770942242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=khQx4CnsxrIKfW3vEXmfF4aXf0Jm31HPz3k9tr+YE8w=;
        b=vSBSQaEAqJf8lsO9dFjpcFrAoGO7juIap+7w9d5eyYHq4UXYjWi24MO1HPBP3hJxRV
         A6dHboaPUZervCEykpAwtzl74+h4GTwUs2vyCxJG1D4tIuj9hEEnCUAVtVg4r3OlwmZZ
         /xIhhoDK10Lq19zXmZ81E1ozV47CS8f4vpz+xLuA5djREhAWYiQWslCAwYj/E4uPliSR
         aD1jXSeAOkmK4k0rdiU758hOfIefVyFBnv5n2Vs3xGXkZohbHBCmugZwO1SE4xxWSKkM
         zHSE7/veLdGmTrn7xsxefvUDy2HwIJPOPmZsxashx1ZSDhEvnCD6EKTnQRDluuW0NYBW
         BCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn2mohEU6ZXogTBr0S56gzpe+pQjwlHFLEyJhleMjDl4kIJ8bYU1issddaLTYDeS7xEsGkMGfh0kk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJK4lvaKV2IwjoCqwlhopxoK/YdhklAyH7tPQZkIxiAPzbDxRZ
	aqzgX+7yDXU2ggVOnZ607OVsBedFPJRDf1SDOKahQOSXjujzys8aqalTiHZGjOw2Bgi12npD1lY
	brFi+5V38tagID56knPyTEDBw6uCoFv5V7tfOQbfewMX02wbGHQmjJCiewqA7tamVR8s0
X-Gm-Gg: AZuq6aL236SdJo9yiMVkau3QjnBQM3N5f+t2s4BNyDfDsHiL9c4dFEaL1LIdwqXCiXx
	hQrvU56KmDmAsVIgCwVIR+M3mzKaBhq/JjdvJTk1NxjXNpe0jv+oA4KrOW3UFDJGC9EJsmzgydA
	SqiEc65YdXQZR1DfHQxnHPIKNI/qcmLyXGuOqkYPOzigSoLiGPiSBbOLRzgjedX5c6z4IX3Dx5I
	w5XHw5+olPerXktl2HPjscQMB/FRUgcdZ5Fas5W6ILrSb9gjKDfGKv+RlG3cYSMaR1gXf/Dy4s+
	TqS97eA3cp3ZHxZUM1eX+Iwkd1QUJi89y0xxHPaRzHbE1fvW65D0r8IC45YjZwV5B9AXqOcBq6P
	KmNhcyHrWOl72ASP245w=
X-Received: by 2002:a05:7300:e7a4:b0:2ab:ca55:b762 with SMTP id 5a478bee46e88-2b856a45fdbmr432289eec.41.1770337441611;
        Thu, 05 Feb 2026 16:24:01 -0800 (PST)
X-Received: by 2002:a05:7300:e7a4:b0:2ab:ca55:b762 with SMTP id 5a478bee46e88-2b856a45fdbmr432268eec.41.1770337441051;
        Thu, 05 Feb 2026 16:24:01 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855af6452sm700373eec.9.2026.02.05.16.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:00 -0800 (PST)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH v1 05/11] riscv: hwprobe.rst: Replace tabs with spaces
Date: Thu,  5 Feb 2026 18:23:43 -0600
Message-ID: <20260206002349.96740-6-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=WZMBqkhX c=1 sm=1 tr=0 ts=698534a2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=DjeV1u91x-28HgnErZYA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: zinemCOg2sMlvJrxs1xeJo6PFxu4JOFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX+thoDFGjBcbh
 gjuQyaT33uNyKrnle993r7BQmdlTjFqgsdNVMsa+A4KB4lguh4ZdO4kU61KpcP8hqGK3UOxk6Kk
 DJBPfi8MepaeoC3HpH8x3lkjm3xn2VImzn5p+JDD+G0W8OKB6EYDJfEuuC66I8jn1Y3T0ZyXqO9
 svnM9nHTp8YR3jgDsPZoqWIw9Q5SMWejsm6eE0kazis26sAXgysst4CWvAiSMMbxkCOlF3es/ol
 4je7n0CZd/+UY/SdhP9v31Yv5zldUiTemSP6T6wJu+hQ7cX8zsLHIEx5Uh+cJbdu1n+M4pZ4ezU
 IVEl1e150hUjGjA7VjE7Roake+9mDSCn9aDGq4bjvMEJnuQQfZNwYPeG5rA1+Qyk8GoBjqt3jbT
 p2t4Fenuffx3PF/rrpSlHyncuSG8IBuJ6D+dF/sQXxkPi2U8OesIkoCWeNvz44OjjtcZClj91cw
 iL0hRtq7lj5n8biTYEw==
X-Proofpoint-ORIG-GUID: zinemCOg2sMlvJrxs1xeJo6PFxu4JOFg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162403_639338_980987C5 
X-CRM114-Status: GOOD (  12.65  )
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

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 0598c9ddd73f..4484f2a7f798 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -362,7 +362,7 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
         extension is supported in the T-Head ISA extensions spec starting from
-	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
+        commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbom block in bytes.
@@ -375,19 +375,19 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD`: The Xsfqmaccdod vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Extensions Specification.
+        Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Instruction Extensions Specification.
+        Instruction Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
         vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
-	Clip Instructions Extensions Specification.
+        Clip Instructions Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
+        Instruction Extensions Specification.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbop block in bytes.
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
