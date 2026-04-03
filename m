Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01D1E85379
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yChexlqyUSf7EAuVrrmefvpdlspkuK13Dy/9R55sX+0=; b=xIKL6ks3WUS8wO
	58hNdcXpdELxtzDRlcQskTEdo3Mcs+KPbZVlMbVAO0tNknp2Nl/kDzvZXqjwkW42dalRCxT3NaIag
	6R89ePPiv1f3StlWAyq0538OITJcfvk1u6IThklcF/IRI2wYVBT/eGlBM53o8dlZ5koAVelCzSwY9
	SbiGXwwb89xxJNrMTCOaRjwF0r0LXGhjdrN4pGoO8qh4cXf0f9IOHV0b79B1KofkaVCapVK8WKmN9
	JVPn73w1a6qGZpvREmALvJKFirmsx3Y1dV2KuvYRWTv/3SATxTU9U0pBEtxiy2lkzkXjde13x75J/
	JeekQQsvVTH7fU5b4ezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gbu-00000002E89-1UQZ;
	Fri, 03 Apr 2026 15:39:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gbs-00000002E7M-0PCt
	for kvm-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 15:39:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633ETfxv140906
	for <kvm-riscv@lists.infradead.org>; Fri, 3 Apr 2026 15:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dlQHizxSHnf89XQwG90apDFP
	E1boyp7qYsxMDR+MAKc=; b=f9YsfV+ajdvocMSfQLYKAK2lumyoUM73YP0zzUm6
	PfpAOWsaVN9ZI2RgMVhw7p/CXwKale7DGZW/s2moMVwBv5WAf65AxPuSb2yh6RyK
	jY9aim51m6nzrDTUGtVryEr9IBS1kGgsvb4HjrGJ8+ZGWZ39vwi+pdOB+gZRxOvC
	EbXnY5B4UKbcdMgqf360mbtrvwULkl2pL4mSB8RL98zKT7CyvgxhS4gP+KDWBr+n
	eWIh7pQSgHHLalv+BDyPXdUCvQ+JcE+mE9UXFrI4FzAm4KbW6HibHJZg8fx3ShLH
	UPU/jmIamyqu/R0jhIx+oCOYjIM2H50FrUEnQFqJMp7niQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y1hn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 03 Apr 2026 15:38:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12711ec96fbso2897231c88.0
        for <kvm-riscv@lists.infradead.org>; Fri, 03 Apr 2026 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775230738; x=1775835538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlQHizxSHnf89XQwG90apDFPE1boyp7qYsxMDR+MAKc=;
        b=RuX3h5kftYThj0ImGBKALXxlm4awlXtZtzczFQgthNRHIzlp5WCerqorkiz53SZCde
         m6r85l2XZar3F5E0ltsb5IzGk3BXjPXZyO2NB9YJxRCstgSV061pyaQRf+tiAeJr+w2N
         ipU1kURTO8cZ6lgU0RH3f/bhVU00lH0PjLTwBqYWxCGejlY303D9ILmScxkWzyRrIGmB
         mH+GsEVCiVDI6OJ4IBW4yJFTNhWAgSldnS8vZI7ccz+m0UjetRXOBqTxeYkspi1QyoqX
         OB6m8xNEEyi5ympCxpKNhV6Ahk+6t0q42ZFudI8xX8d5Ivr9tbgUWQ2xquYvji2FL9lU
         aVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775230738; x=1775835538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlQHizxSHnf89XQwG90apDFPE1boyp7qYsxMDR+MAKc=;
        b=XtEslE8ycbjD5EhN/q1VrkMhYHfNNbhaRrlzp+Rxcplxof9ZKc0n9XAm9gVnK9B6ld
         7ASg8XBAhi9qitbg2RpQsap5qOtV2WG8mcLIqFtNJbHi8Qhqd3RXix2gXUNB6wCyUfkZ
         a7fSpXSnGRYLbmPKcwWebcaTj+XPFZydtEOlHQYgk5GNh2Zt9VCBqmJuZl4egrZ97cBD
         cnmrloLeSnPYatbkJfBTJGqSeXOph9uRgtHmS2lHinnZvX7ZUpFfNSmWUPCgaxIfUCnU
         hdnFxKgnM023oYinl4VuuNiVze/dSC2Xo422jUc7b04qwLxz7Mmm46ZyM/c3Mly7jkOy
         Lu5A==
X-Gm-Message-State: AOJu0YwPVMbGKezgWadCa3ehg6TODQ5f4Ru1Cfu/Q3xOSy9vq3so4ARj
	GG8lqv8j1jnRJ4EzEAbGvGxyCyDIk+EHmN5axUn6MKRIAifFlQuPbNFZJqzrYiJUA0BPIcUaGCI
	CIF+fqXu0T8xOsGPWYgaS1wWG9fYKY9WKxJObeGMZ/lB1GBSIkXjOS61JZn76uPrIMsL9
X-Gm-Gg: ATEYQzyKCjPcd2ZNxUYQqkMCujDf7vtbIdw1LGEcidZrwAxEs4yWmg78KXgquLRppNF
	4HLK+yvxz12MnZNPBDuXpbG0mJ0aIH2PvLxSOVWTvShBFQejD6Jd7lDV8yO3k2AVPIKYpGD66Ln
	sDlz5uKy1YyLGAjKJ6mu2QdjjIRy3dWyJaZxb12BNomgwIzMEXJDBV8bKr7jdoti2Ub85cQ/75R
	Wo4/5cPC7GgGYka4Pv6g8RSqOPLnnetexCIqc9+gZbCck5AkaBD0VFoxi0bIkky9V6Enrp5G36Z
	OBoWnkALD53FmUBMBr6qbHucCHTxOSD+9QGzay5vz7I+XCQHv8SLGmzKuUDawLEsN97iIGDe3+u
	PUZghDk+3fwwyCyvdH1o9ZGqkaMgxfo4=
X-Received: by 2002:a05:7022:6997:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12bfb7455dcmr1659269c88.24.1775230737734;
        Fri, 03 Apr 2026 08:38:57 -0700 (PDT)
X-Received: by 2002:a05:7022:6997:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12bfb7455dcmr1659243c88.24.1775230737154;
        Fri, 03 Apr 2026 08:38:57 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedea9807sm4669086c88.15.2026.04.03.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:38:56 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:38:55 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix shift-out-of-bounds in
 make_xfence_request()
Message-ID: <wneyyisnu6rtkzwpdantjfb6e3fzakkc4gbyfuanavunjoxaev@5niyyh64rdrb>
References: <20260403061302.2203179-1-xujiakai2025@iscas.ac.cn>
 <hkbpiuquqvsseu7tkv5gtlfxlj7qvsjoj6rndntty2btpcmdpx@4dfgpwffld2k>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <hkbpiuquqvsseu7tkv5gtlfxlj7qvsjoj6rndntty2btpcmdpx@4dfgpwffld2k>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cfdf12 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=MZhlcbl5PfivOvk-ML8A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 4UOqAb7i8xcT2yUbdgMHWCiyio174Ed8
X-Proofpoint-GUID: 4UOqAb7i8xcT2yUbdgMHWCiyio174Ed8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEzOCBTYWx0ZWRfX8bKkIg/oYjKY
 Q1/fuboP7q66N+AeTqig9jVSLO66DuAWI5eH8iaDOm47TI/Jq8Ihs3Dm+Zpx3eJoc7fq5oqpUaj
 Rg6wF6GcaDMazavJvPitYlHP3AX9BT9dqdEjIpbN7UyNMnWi7/8V/tJnrH9CBapwW0pSunJX0sa
 yl5OCet1jPcXN6Og7zfEUbCPlUp7lu074U4UyxiHn181Plw0H0sMLI/UT+ss1P0lSjCFxyyoVY0
 vfvGj3D62B0yj8ilGPzgKA4LZfx2/mWy8l/fBUgsYmhnggejqrhVICDDNI/zyHKQCxgonVh8BHG
 /x1u8UUwjCgL5Ztdyz9B4wvHP4MOPQEqbBClcDLCHNLIXmNdtYVsGTHmLlHwBWKVezhIHiJR+2u
 PNYLOylz7VQ5S+UowlFV3NNxNoX5lnG1nH84SHn1AP41MzA4sr7ucwFMI5cWbCLDcxPJtvJGGQ+
 YCIArqpXzHwgR9COLqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_083900_145996_09DFF2C5 
X-CRM114-Status: GOOD (  30.47  )
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

On Fri, Apr 03, 2026 at 10:30:35AM -0500, Andrew Jones wrote:
> On Fri, Apr 03, 2026 at 06:13:02AM +0000, Jiakai Xu wrote:
> > The make_xfence_request() function uses a shift operation to check if a
> > vCPU is in the hart mask:
> > 
> >   if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> > 
> > However, when the difference between vcpu_id and hbase
> > is >= BITS_PER_LONG, the shift operation causes undefined behavior.
> > 
> > This was detected by UBSAN:
> >   UBSAN: shift-out-of-bounds in arch/riscv/kvm/tlb.c:343:23
> >   shift exponent 256 is too large for 64-bit type 'long unsigned int'
> > 
> > Fix this by adding a bounds check before the shift operation.
> > 
> > This bug was found by fuzzing the KVM RISC-V interface.
> > 
> > Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
> > Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> > Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> > ---
> >  arch/riscv/kvm/tlb.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> > index ff1aeac4eb8eb..500e001513a11 100644
> > --- a/arch/riscv/kvm/tlb.c
> > +++ b/arch/riscv/kvm/tlb.c
> > @@ -333,14 +333,17 @@ static void make_xfence_request(struct kvm *kvm,
> >  	unsigned long i;
> >  	struct kvm_vcpu *vcpu;
> >  	unsigned int actual_req = req;
> > +	unsigned int idx;
> >  	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
> >  
> >  	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
> >  	kvm_for_each_vcpu(i, vcpu, kvm) {
> >  		if (hbase != -1UL) {
> > -			if (vcpu->vcpu_id < hbase)
> > +			idx = vcpu->vcpu_id - hbase;
> > +
> > +			if (idx < 0 || idx >= BITS_PER_LONG)
> 
> idx is unsigned, so I would expect this 'idx < 0' to produce a warning
> that it's always false.
> 
> I wouldn't introduce idx and just change the current condition instead
> 
>   if (vcpu->vcpu_id < hbase || vcpu->vcpu_id >= hbase + BITS_PER_LONG)
>      continue;
> 
> >  				continue;
> > -			if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> > +			if (!(hmask & (1UL << idx)))
> >  				continue;
> >  		}
> >  
> > -- 
> > 2.34.1
> > 
> 
> unsigned arithmetic makes my head hurt. It would hurt less if we
> guaranteed the ranges of all the components. vcpu_ids are
> guaranteed to be [ 0, min(KVM_MAX_VCPU_IDS, INT_MAX) ), see
> kvm_vm_ioctl_create_vcpu(). We should also test and reject hbase
> and hmask in all the SBI calls to ensure that hbase is in the
> same range as vcpu_ids and hmask is in the [0, BITS_PER_LONG)
> range.

eh, scratch this last phrase. Of course hmask can be [0, ULONG_MAX], not
just [0, BITS_PER_LONG) - so it doesn't need a range check. I guess my
head hurt too much when I wrote that...

drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
