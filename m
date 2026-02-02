Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E523CE7DF1F
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 19:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NlnTVFYLIMuxauE2jGJBFGzVeOrNP1LN32G5uv3tGGU=; b=VidR0Qh7zYKxuu
	qQHIX5iQCRykVzRPZicG3CjAmG32YgbVNLyNGmoM2Y4sbiBnezbaG0+6COZWJjUFRgVKXBfXZ4Cac
	Hdz4yeMbhGYTYUkSKIdMmBqNdwxwrUz8w2BJneKo/B4/7898zkAMLrdVo1s9BpWq8NydGORUuebj9
	0bE2BR5QaTAPKiwM65QYVpSFjlqFL2dJmtJDQUMBE7TKyha9nk9OH5OzgmnQgrxpdLipliqRKJ7U6
	P9R+7oQ7SHlWFEs0AoqRZqYnoU7oGvoXnioJfVryLmT0isoxNNJJhHnxwBtDvvWVqYfF+7nTblQh1
	j40ARlsfU5YU3Mxe3AaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzNT-00000005Uhg-1fPl;
	Mon, 02 Feb 2026 19:14:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzNR-00000005UgX-3g6s
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 19:14:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612J67Cu3915994
	for <kvm-riscv@lists.infradead.org>; Mon, 2 Feb 2026 19:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8zI+RIop4TnDr5DdAUmDHiyZhpKs0Nv2xs4iv2+KGE=; b=S4pPMtsCc78QnI5G
	/VtZ9+pEPulUv/gY0C4oEuQlmLvZ5LxZDmQeMk/oXwp2u2Z/FSopfMRZlITtFVtm
	AM2gzLtqaigijBFZRqxGUY8MYRfHB3ysBtr5XzRIQ2CEdaBamMBz0IH/nNGwu170
	HrJqJAmRpH+wVy07ZoyDzi7hrUkoNS6SJiy+TMOZanhSCOivZrtxB1sxqD1a5Rug
	6inUY+m/XSR38YQC8/VWtLgZ3dDKDeIj5hezzRQKu3WeBCBQvL4FmstGDRvLWfy9
	c1xcrFm5JzmgG5xson/0wfZDrR7LDNgNgPJi5ZO66jJP574sUtO7yoqU/VioeFuO
	dzj00g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmhj43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 02 Feb 2026 19:14:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca06e38994so553503785a.3
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Feb 2026 11:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770059664; x=1770664464; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8zI+RIop4TnDr5DdAUmDHiyZhpKs0Nv2xs4iv2+KGE=;
        b=L2sjANszWKq50NglZqjoVcZi/SLsFz9gU3zXAW0NkMvs5w6gviJQT+OnxwXHCR9esl
         M/bpZnLrPw3ELhGTCssOIZHtdZUEooZdY9YwtARoc+N9d5Ta8BzXJkwjp+Zd5AmY3Jml
         rcGmlUArOWLMtGagO/a1RGW+tQSfE1FnUJoxez+3kBsiGOdCj/A5Tps/LKOc7iA9/Amg
         n40Wc2G1vcmW/ROSoRedRGCPVLvrkdTalKlw6AER9ClRkfgFKU65EANvf1Tml9s70QrG
         upM7cRc3W4vxE2lsizK+cIYPMqlyfX8mv8Elj8SeN2nbSa+4EkHB2zjrom+y5IMkoCt8
         OkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770059664; x=1770664464;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8zI+RIop4TnDr5DdAUmDHiyZhpKs0Nv2xs4iv2+KGE=;
        b=W85tD6lBIQtmLcX31a8bVs9bSsfbrylVR47iuO99MTH9eo12IU+PYXQtSBGogKE7ir
         r+mIImnVXPh2KRZdPpADLVedBZNJ/+hKBfWI53snZdlWDjJX/U+SBYn2g1BcToo4SI4Y
         9bZBbRTob1W83MpYyJ8KSCXz9YdaOVX8nqrSXosCvFIvxPvNn4hFfnzomDZJi31FoQcN
         6ud/bPnmtEWpK6CIQhraw2g2bGnAJTesS4L2PwCDyExcpGSXgr7IlL0gAsko5NmhDJtP
         69bdmku+I4njCs9T1uR3oOi10dcm5LeVZ04cP5/8yDN7dk4YzdmcwmE/n6hdQDBueVh7
         LJPw==
X-Forwarded-Encrypted: i=1; AJvYcCU7buUAglroEm+rkCzdj5OGQ1nNAZZ8whC0IDmliZpQxN/8JKaBFj9iBAEFDHvjRYY4cPKrCdOgCJY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzICIeL54PFBisl+qeKDZPIPd/rtHOR4iPSkoontLJQZKqK2Cin
	/bDxoaxPYcdZTNx/qZwpDVMW9DBkwUJgf9fGRkoil4DnYZ4ibu2HdgS0mqpSlwPf9p1cn7JrlR9
	sr+Ip+qyYaRS2G/p8IxPalAINzNPmldvTuXoeQhzbWqWQP2Yj+djZsVhdGfdhKDmAYalK
X-Gm-Gg: AZuq6aK26zfCJhjp63q9BNn3E+hfBdj8nrs8KkAU3zd9ZyXBzvVVw+FQ8bJyRIEMcsz
	v5VriY9uZbMQhkNhvOu50pjwrvpotFYnHzqxxOWqEk11Qsj4PvS6Ek7wB7XKhAS+LLX0v2hAg4j
	7UpXF0lQgI2rvmG6p6Clq6RnhGDskpGlLKyOIoENUvXEQApJJOtL+OVCh2dxcTv0EGLyK7dR1Om
	VLE/25wKq8n1Kkty85ofEE/Q75Pv8Tc7JbAqXEGwkit+Qh1DXwaB6n6gUGQLhLWsGNUa9cjiyIx
	7ljpuVazsFGfSW5gwyHVQ3eBG+MZRnbuKH57ZUF1BAQqmboOcm3YIZhVHxnQLB1hGt7p3/e3WhT
	K6Xd+F9QotzcbftxodAuSK5Hfr3ROIkR4g/lwApTYkW6kmwtJ
X-Received: by 2002:a05:620a:254c:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c9eb330b40mr1572184785a.82.1770059664078;
        Mon, 02 Feb 2026 11:14:24 -0800 (PST)
X-Received: by 2002:a05:620a:254c:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c9eb330b40mr1572179985a.82.1770059663552;
        Mon, 02 Feb 2026 11:14:23 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e267b699sm98668775e9.16.2026.02.02.11.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:14:22 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 02 Feb 2026 19:14:21 +0000
Message-Id: <DG4PS6NRRUC1.1FL8WBJVEEM4D@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>, <rkrcmar@ventanamicro.com>,
        <andrew.jones@oss.qualcomm.com>, <linux-doc@vger.kernel.org>,
        <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
 <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6980f790 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=PElOwc1BOWmaZxrSg6EA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: vhaxV3BVo8HNV62jje6yKsWKvqZG97GW
X-Proofpoint-ORIG-GUID: vhaxV3BVo8HNV62jje6yKsWKvqZG97GW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MCBTYWx0ZWRfXxbzA+RD4RFvz
 z3A19LSkw8DdDrCC1X6XuB5AwnMLi9MzLkc/q4QJ7eYq0kPPBdAMSBiFaY1mN+69eD6cg66VfSe
 klX2WDqwQcBYARecXKL5q+NWKNCo6VvrAY00/IC1m9LzomBCTZx7cpLFz/f3HEOWdpfsSLKHZ79
 d/U6MZAGsYRC76YpbYcoI9gpIGZjMWkGix+mj71a5MTWyTD4mHrJ3Z6LztvGe6dztRYk8gYUVNx
 id5ndeLv4uq6skzY+yAkWZ8MEtgQOTCtCNr9SfweDXudLxkZgiB9i+2rZBedFJPHikqdGvY3Lnv
 POPG3pA8tSuJII3sm7ZBvF8PU5CeehX19pqQkW9sVIBetz28qmoxxHcr+2r0Hby+p7vnkOWYE2a
 msyaeoD6K2IWJLpviLeuuo/pmvSVAX+iWYT/HRFcCTmrXhHYi71GUbPsMtOE49kXra5jTpECsva
 lhw1YS9ghdy4UN1B6vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_111426_041682_282F7A9C 
X-CRM114-Status: GOOD (  13.37  )
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

2026-02-02T22:07:14+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
> supported by the host and record them in a bitmask. Keep tracking the
> maximum supported G-stage page table level for existing internal users.
>
> Also provide lightweight helpers to retrieve the supported-mode bitmask
> and validate a requested HGATP.MODE against it.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> @@ -75,4 +76,40 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
> +enum kvm_riscv_hgatp_mode_bit {
> +	HGATP_MODE_SV39X4_BIT = 0,
> +	HGATP_MODE_SV48X4_BIT = 1,
> +	HGATP_MODE_SV57X4_BIT = 2,

I think it's a bit awkward to pass 9 when selecting the hgatp mode, but
then look for bit 0 when detecting it...
Why not to use the RVI defined values for this UABI as well?

There are only 16 possible hgatp.mode values, so we're fine storing them
in a bitmap even on RV32.

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
