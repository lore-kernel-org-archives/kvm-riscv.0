Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07BDE85377
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 15:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wic5T96ZDcPltyFcsi/VU1nctDHMMd821CskxGM1QjY=; b=VzBzwsS3j3EKcW
	892mRffJjOpuiXd+vgxkPCXqGkArlyFWtVxqbihYZV0XdK+OSk7fswz6enObWXhUxQY1dJtSX+EPR
	rwz3BVNPYVxgi/az5ldiOCeudErV7ioVQwGDQU7cC1dxKVGkQJITBYIbdUQIX/4YkP4mnJdp3APXL
	5vMy47OZKqzO4gXONc4t1umRDkF1wqktzYfBtdaExgpT+XCledRp1IDGaw+IJ5ZuqWyWB9n25sPsQ
	TafKKaNvU4+q3mCXH0XMpnZQlzxmOgcrJeFlS/YcMjH0aHVvRL2O6tgGJVM91WvNbaUHaWfFk+ncj
	QFKzPqCVA7hHbeocInnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gTr-00000002DIv-2VF6;
	Fri, 03 Apr 2026 15:30:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gTn-00000002DDp-2VDF
	for kvm-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 15:30:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633AxVVE3803971
	for <kvm-riscv@lists.infradead.org>; Fri, 3 Apr 2026 15:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x057pD4qBgfPmH6mGQKhbfbL
	KZ/u2npmqoIAxD1CZvw=; b=L02kEkE9FOYWgfe2dQtakWR9UsPL3StLa56Iu0UF
	3res9c4iJA2e2FD9Rp+3DG+v7VSToZub/BnjJiCP+7K6tdIhwJ1EoEFcTOWR3jkZ
	SJEexQqo05ehKOtc5SCv+Ej0nOFkYW7MlsnqhA+rlnSns4uAo53KYfK1xapvjbCC
	qAGNFWR+KyQfTqUzt67Z5lEWqH8a23fCEj4LSxgQ5Vt4IiZF+GUDCNAQvXjvRIdh
	6pcmW612kZN07QsahOzFfotPhL3Ju3R7JoVzCjm+IwZRks+wioNpnxDPYKieR6uH
	/VO0v+QX5ArUi2IxNrU4eFCVEQQTxssoixyoqMRzAqb/PQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dac9f8qa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 03 Apr 2026 15:30:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so2105905eec.0
        for <kvm-riscv@lists.infradead.org>; Fri, 03 Apr 2026 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775230237; x=1775835037; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x057pD4qBgfPmH6mGQKhbfbLKZ/u2npmqoIAxD1CZvw=;
        b=G/jgboqv7ixXwUwn7DGrdIEcYl6TbB7OqNQeuhqjVaZAbDy7bgVNaTqPmTpF+v54Al
         GeWT8XgYWI4FBYJ5CfyBZHzzDA3Yj2f/zX1iobumsE7nf84+p73jFYYJetBcZr1bLQWJ
         VXjg6Xt8ot7XaWOuapOpD05TeMOfUnfgQ1myXq5z4r9a40GWeLqZm7yv4rQKxnMP45pq
         Or03RdOEnRZg+gYbII3yluYmmX02uzeLT9onq7ARextdCMf0kzPt+KEme7Wark6qwj7E
         wsSEBVT/nxBBM74Q5iHErfbBI5at54EVKN11QUndLUn/Z1BZoeZqBqnDA4SEic3kY/Gw
         Vwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775230237; x=1775835037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x057pD4qBgfPmH6mGQKhbfbLKZ/u2npmqoIAxD1CZvw=;
        b=QHf5NqYOjYIHwRtzLivSJh+Ig0GXrJXQekgl4SoFrXsnU8UYQo6VwJMIPP4nMoGf9d
         AEkghERYTkLGYb2wwYTj4CsWzJW3L+Ep96okf4Gwn8P8qXUgtRdI4LWfqHgQmB6AwZQU
         fSjbFEIJFZDaQViDb9x7qNTgefgWldkzqMA8pYaq5pjEbAc7sxgEc7srjEzGDAMVOMuo
         SSdCVKl2T3mul0XYn3iOjknZAUY+cRAj13K+LIpeZVJ835ivdlBPpV2hc+Zt8zUTljOh
         5p9fpqfp+p+/drjb6K8GJTsXOnKiJPGY3o+DCAvExFZBp9VuRKHwzlsP2YhsZLLY8MLa
         nZ9A==
X-Gm-Message-State: AOJu0YwNQ3SacDanCwhAuvnlbeUdBsjlH7K3NintVTCIH4wH2Bz2A02p
	PuADbfk+9/h+kJnssdMI2GvqoTyDdgcD+zWXMKR+W1qnmMA/Cg4mOhz8cTKusaKLQBBc0XcJaoN
	Al0wjb5pSaJQ80u2ifEUlAK7rTM87Na9xR2e8Z9xyNJ0iX5DXBd4dXzTJguLpspiAu/ewS5bDFu
	Uw
X-Gm-Gg: AeBDiev6a/+gaHi2rD5xC+twn2wk3NuUDFnWtAZAyFPUgUa8dAHdlPCLglBLeHhbRl3
	2Lt3mIW5IrEKh1+9u6ZDj+K2nf1zeLKpxw1few9NQrZVp+od1ZPIrYCP2+iv7ilMEQU3fv6Ngc6
	My/WDvbCoe50DAIH2xzsLH3qnuc750dZUR6TcMid8lJjMXfE3od9TPT+KuvT4L5WSvEWAcd2Gdy
	hmf+fkmcS01vLKUqHmpVglAUDf+CSX6PQfn956wlWT/cVeVefCKR76zQ1FI58IAkxO1BasPbni7
	kZqB5x2uZ9B1wjb5Ss9gbnKe0UtGuIOgBwasqWX5jG2Z/VhCQW//l9OTBU89x6/9qhKTkbL3fi0
	+3ZiD4T2zOKpp2OS15k3djQhgWOMH0kc=
X-Received: by 2002:a05:7300:6c1f:b0:2c1:517d:5e97 with SMTP id 5a478bee46e88-2cbf9ee8ce0mr1399185eec.7.1775230237332;
        Fri, 03 Apr 2026 08:30:37 -0700 (PDT)
X-Received: by 2002:a05:7300:6c1f:b0:2c1:517d:5e97 with SMTP id 5a478bee46e88-2cbf9ee8ce0mr1399167eec.7.1775230236741;
        Fri, 03 Apr 2026 08:30:36 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cc0c6ec215sm2627655eec.4.2026.04.03.08.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:30:36 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:30:35 -0500
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
Message-ID: <hkbpiuquqvsseu7tkv5gtlfxlj7qvsjoj6rndntty2btpcmdpx@4dfgpwffld2k>
References: <20260403061302.2203179-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403061302.2203179-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: ZgQybez5QKZPrZ1poKOHkXdNIvONTyFs
X-Proofpoint-ORIG-GUID: ZgQybez5QKZPrZ1poKOHkXdNIvONTyFs
X-Authority-Analysis: v=2.4 cv=BO++bVQG c=1 sm=1 tr=0 ts=69cfdd1e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=rTD6Z3Ji9OhdE_Ng1OYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEzNyBTYWx0ZWRfXz0++cJEXx3BY
 GBu2E0ORBcQ9zztIFetcG0POxX0sZ59Y282OuWPLZWzRV4J5lWc8gzOZ2r4aPnp7WzRk6MwXyNK
 s0USA+qZ15Dj4/u9JJdMUoS8kvvkc1m1zFoq/tDHdvOdae1bBDaShkORHF5A9PynkHAnKBkZC8b
 +cLoWLuZFdSS9WO3jPfc9FlwPSBLFr3FAF+UDjeJhYm3K9HE2+unDGTufkp07ZAlkfoihdbQDbS
 a5Akq7nrtAdPnflErBlB3ZMDXbDgBxEzy0JhWCErFupTkGSx9dzbY+gcA6lKvV0NxmnULDJIa6X
 HOxLhAoUbb7N+Keaejx1aS5dKnu49R9Vrf4HTLV+gmI3kM64Ri3fftTaIqRycMHxSqRWEzEGN/P
 ulVmaM1lCAN8JuRS3koVpmBK8a0l4FTvDQOhtfPoN7VL1nufeLLoa2kjhi9T6LSZmiyxvR8MM21
 bQFt3X3EU75eJtj9SKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_083039_694531_905AF533 
X-CRM114-Status: GOOD (  25.11  )
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

On Fri, Apr 03, 2026 at 06:13:02AM +0000, Jiakai Xu wrote:
> The make_xfence_request() function uses a shift operation to check if a
> vCPU is in the hart mask:
> 
>   if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> 
> However, when the difference between vcpu_id and hbase
> is >= BITS_PER_LONG, the shift operation causes undefined behavior.
> 
> This was detected by UBSAN:
>   UBSAN: shift-out-of-bounds in arch/riscv/kvm/tlb.c:343:23
>   shift exponent 256 is too large for 64-bit type 'long unsigned int'
> 
> Fix this by adding a bounds check before the shift operation.
> 
> This bug was found by fuzzing the KVM RISC-V interface.
> 
> Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> ---
>  arch/riscv/kvm/tlb.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index ff1aeac4eb8eb..500e001513a11 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -333,14 +333,17 @@ static void make_xfence_request(struct kvm *kvm,
>  	unsigned long i;
>  	struct kvm_vcpu *vcpu;
>  	unsigned int actual_req = req;
> +	unsigned int idx;
>  	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
>  
>  	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		if (hbase != -1UL) {
> -			if (vcpu->vcpu_id < hbase)
> +			idx = vcpu->vcpu_id - hbase;
> +
> +			if (idx < 0 || idx >= BITS_PER_LONG)

idx is unsigned, so I would expect this 'idx < 0' to produce a warning
that it's always false.

I wouldn't introduce idx and just change the current condition instead

  if (vcpu->vcpu_id < hbase || vcpu->vcpu_id >= hbase + BITS_PER_LONG)
     continue;

>  				continue;
> -			if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> +			if (!(hmask & (1UL << idx)))
>  				continue;
>  		}
>  
> -- 
> 2.34.1
> 

unsigned arithmetic makes my head hurt. It would hurt less if we
guaranteed the ranges of all the components. vcpu_ids are
guaranteed to be [ 0, min(KVM_MAX_VCPU_IDS, INT_MAX) ), see
kvm_vm_ioctl_create_vcpu(). We should also test and reject hbase
and hmask in all the SBI calls to ensure that hbase is in the
same range as vcpu_ids and hmask is in the [0, BITS_PER_LONG)
range.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
