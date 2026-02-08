Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827ACEF06E2
	for <kvm-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0rCHiYbDXYiYCalKkEt44UT5jvKMXsnglNdBHMnPUI=; b=btOeCi/V+2WpTp
	TrLyHv5xJ17bGheoY45Jv02BKUHh7hHIh47tkLLWyxfbes263nwBntSR1yTqxfSf3tI1JqpyaW8zT
	e/ykCTTFcQkXfNUZkWq+0qGRC6Hc+Y5dgrBg9GiQTSONcGkOJQfO+RYEozxmsD3FzohQrnPJHfxti
	cQJHP9x5Njck3qq4H+L1GlP4iKNXbCb1fdojmndYUxrhb2Bq54jdqGEsev8KSbzo+PiwKGSYITloE
	nIPQM8YlvhRRORDn1T+wAC4rbN2elbdjGOJjryR4A7V8bXjDpzu+d2IwIoBTsies7BX63v+byRIjD
	u4zJXKNFJZ5tcY0u+l9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp7RV-0000000DRk9-1Bma;
	Sun, 08 Feb 2026 16:15:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp7RS-0000000DRhY-0esn
	for kvm-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 16:15:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618Budrf4131304
	for <kvm-riscv@lists.infradead.org>; Sun, 8 Feb 2026 16:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tEZvuD7PszcvIhjHPQ44DwrS
	7K/2mzb6NKM1cf9Fq+s=; b=Ek3q8dh3vTid99CagXWhxx91gyx/B54lCKqbKPh3
	xPreGTT76MiZnsBoKZVZX4zRHc8YpfRdWU1avt4sSDczYE9vhBsh0/KAvPnjWw1f
	M9jT7hr0ZlgaHVVh8k+P6giW6BEPxAXlpePn3TZ0kvS5XS4Epat5hNo5BUSGTyLY
	z6l72TrSU5jYf+csB3OZyc9M0e7yIqWGEp1fOgvncv88W2it0wZ18JglFRNEIalP
	+bUty3sunPxPpv5uLXfSGc9uqy7XJJF9MqNB6sFZQxhnxeun7EerI1bS1rxrl8c1
	5bb+zdTYnS1TAnl1kiA9YGF/1/9u9n5U6yGHPkRUzoQzpA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4tmje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Sun, 08 Feb 2026 16:15:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b6b9c1249fso2779503eec.1
        for <kvm-riscv@lists.infradead.org>; Sun, 08 Feb 2026 08:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770567318; x=1771172118; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tEZvuD7PszcvIhjHPQ44DwrS7K/2mzb6NKM1cf9Fq+s=;
        b=I9UMuBJJzdgD1azwb6AExaI9QmK8qJ2usA/PswQygCiUS43urerZHRDZs1GVO4Idri
         MHfwr4CcOir89J+kLiEnfhwHLR2katnX4fKzC/k5FCO1GnLqRCzVUbNJ2R9pkOX/MMao
         hoK7EpeNLscw0VQozBU9146v9vtodkfro69X/4L8xTOo720NRqaYhP4nGn3rKbNRUglD
         8fIUF6+Yyo2Kvc6hUKT8M3iPyxbZasPWlQwvILciYXC93zEk8kXigr9iBLPsKp+tVUtu
         J8hB8NJQyo9aPWhI96UxOMQ0Ljg8I3oo8blWOZiqPBPp0F6yzQFa+2tMhJRun/PxNE3a
         Kzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770567318; x=1771172118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEZvuD7PszcvIhjHPQ44DwrS7K/2mzb6NKM1cf9Fq+s=;
        b=IfaD0ZMRbkqqzCyMm1znv1HwMeH45s9JCxeSOkPBD1YAFcw5SoKco/9hrYSOHEAYRv
         9E/vZXJndE3Rjw7IifLTZULjQPx4Iwy+yO8elOZpT6GzERldM8N2WcOZfXM4dHDaCGaj
         PVA29ZGCQsrn86pu3+o+CKoPDAOADrb9FXz30sDRoAkOwrpZZpzJxPEnSbAbw9DkBSOo
         2p1eEVDVF1ttLqSkATrj2jczSYcwIzomPgU5oXrAgRwSp7D89Y+l5bGLwnBQrHuvatbk
         5gpDOqEhAU8Y7/UUzWlJBfuDhMLlXlIaYT+l81DTPmO/h20Qp64GfOw8ehqJ95TBRoVx
         7yvw==
X-Forwarded-Encrypted: i=1; AJvYcCV1/rzYoin0JTKApkmGsX1aOX/vpFuz1tx553KQuJ+w6W4xChLR1VsNkXr+o7SbT7llhP4cxAchxXs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQZLS7iy6MCLp7MjFsd9FGp4m5hgwiseJer2BMoGJySGjdYnf8
	7tZZN/wj85z2496LgjT04Au+coH1lCSMlcMfYdtHpM/+pnQ/2PlLuPt82XpUOCbbfHf+hJOnwlV
	azof59OMGGE/SJ+kiNI1xiL/+y7AUSxOAF5sGxd79xTN2zuSzhpBAEjOuh9Gj5uQiNZAB
X-Gm-Gg: AZuq6aJOj4pAh7M2MnUJpmtKHfMyiwvjQyAY5BhOI+3lpJkjUHLaqCIsCfiGvDpK5Nu
	4uDbvkf+PnmwJT9MT6PmqQEwuotY4UFZMSUcxo0cZzAykFG8GebJ39XjtPdoWXKdsRIQrDLDSkl
	zJvUtr+gkwsUUyFgARNY0llqKZCyupUuhNy+5E9yiY42/ZJcDQ2WIM1iK98xmvcYz7A+Nf5Tlbm
	e3h6Fp0TkbqfjKWlDYEvr1U5GoAXHBjkCiWjhTKf2iDL/OLI/cXoLFafMi9TqyC7M87shoM9JT9
	YSds8+49wBgJVGg88wxD3TLoHZ/6xGUFPX4MDD1JAnnwbOmF1Bo8jnUfNcpGTu7daQLJDpTJ0GP
	O5Ir4XavrXIJOUSZhYto=
X-Received: by 2002:a05:693c:60d8:b0:2ba:6aef:6959 with SMTP id 5a478bee46e88-2ba6aefa62dmr561799eec.27.1770567317610;
        Sun, 08 Feb 2026 08:15:17 -0800 (PST)
X-Received: by 2002:a05:693c:60d8:b0:2ba:6aef:6959 with SMTP id 5a478bee46e88-2ba6aefa62dmr561793eec.27.1770567316986;
        Sun, 08 Feb 2026 08:15:16 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855af7806sm5952312eec.10.2026.02.08.08.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 08:15:16 -0800 (PST)
Date: Sun, 8 Feb 2026 10:15:15 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 08/11] riscv: hwprobe: Introduce rva23u64 base
 behavior
Message-ID: <3ffm2j66avwpud3sdgjua7jrkhb7bgbaxlp3jnzve7p2xpmcnj@slek5n6t54zn>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-9-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206002349.96740-9-andrew.jones@oss.qualcomm.com>
X-Proofpoint-GUID: J6z0H5aZwpwrbGMKSZApTneoGQs3Wmhl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE0MCBTYWx0ZWRfXzuqThBFt4mm9
 vVmB14xWw+HssvrZ5f1F39tnhuoNVZC8DopBJ5EJLItw/qGgjAL7iSfg0gtw6O3Yor7ydomy+Rx
 Q+1et1mqgBy+UtaEAgp745zidupaBAgWA4mpVRpmSrz2qdCiydcipiT0Hi+YdlT5OUvClJtR+2O
 lp/4o0UIoLorEiXvi6KarcSdPEAA6+QO7HI5XSrx4sZLDlCOGoGXYCc2JrR9K7ulcgmqZohWEJu
 AYHuWBlo3YQpLa0oUnrr8GQoqASk5YMVLNIo/ruouFZ6XaP8md99sGUybfsVqUNNROSnIBjY2xI
 PmShadN99rFcoOSOQHVhEVYk6e+VMj7k84rvhlZSONugghtRWrm1MjXreNK4aZTlfsqfY/s27xL
 0JzqWkqmjMyWrN4sx5a9H42z9QkGvklotr3okq2LTTyHLiDaj+sOKI24VigUsej4Od1i4dI/CsD
 krpOtSH8XZDijtq4Wog==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=6988b696 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=ZTsgeh6Hs3hiWlqVS5QA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: J6z0H5aZwpwrbGMKSZApTneoGQs3Wmhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602080140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_081522_344905_14C4E022 
X-CRM114-Status: GOOD (  14.96  )
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

On Thu, Feb 05, 2026 at 06:23:46PM -0600, Andrew Jones wrote:
...
> +static bool hwprobe_has_rva23u64(const struct cpumask *cpus)
> +{
> +	struct riscv_hwprobe pair;
> +
> +	if (!IS_ENABLED(CONFIG_64BIT))
> +		return false;
> +
> +	/* Additional mandates for Zic64b and Supm */
> +	if (riscv_cbom_block_size != 64 ||
> +	    riscv_cbop_block_size != 64 ||
> +	    riscv_cboz_block_size != 64 ||
> +	    !riscv_have_user_pmlen_7)
> +		return false;
> +

Thanks to kernel test robot's report I'll fix the compilation of this for
configs without RISCV_ISA_SUPM with the following change and something
similar for patch10.

Thanks,
drew

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 4b9981b15ebe..3fd63ac7dd60 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -278,7 +278,7 @@ static bool hwprobe_has_rva23u64(const struct cpumask *cpus)
        if (riscv_cbom_block_size != 64 ||
            riscv_cbop_block_size != 64 ||
            riscv_cboz_block_size != 64 ||
-           !riscv_have_user_pmlen_7)
+           !IS_ENABLED(CONFIG_RISCV_ISA_SUPM) || !riscv_have_user_pmlen_7)
                return false;

        hwprobe_isa_ext0(&pair, cpus);

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
