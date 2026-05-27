Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9163CD5BD0
	for <kvm-riscv@archiver.kernel.org>; Wed, 27 May 2026 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DTG4eI+HeRvMOfsDD49bIQvYPVrEkc+fQYfq3O6jIo=; b=ryv5t23GSfC2XB
	dxwwskOlKGUHP7n0NdnjIgQU7eFcGKShuxBwF+PQQ4kDdspoQ4nepGRxaSfPV4FVwTGX0PB+zPpDC
	NlyL2YA3w6R+/WB+F5Zl2LY9TzshEShcJ6keeXp/WmazmCag64IkInQAZHhNJeg1CZNWDq4Vy+sfU
	DZjIakXkJg54KbNIFjYlC6hYDVpmBom8O63ePS4T+qzqsUrFtuWHMSxGo7G1Q1LeHtDTlTQ6mJpT8
	PzO+jKWAtQqcAf3rwPaMuFWP0y3UIXyaxYkm17E89lptFtXiz7i7/XnI3FiMjrS5k3MPymWVYU1VF
	1ODaQc7DSMcnyyzX9Cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGZe-00000004Rqh-2dJC;
	Wed, 27 May 2026 15:53:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGZb-00000004Rpj-1C7W
	for kvm-riscv@lists.infradead.org;
	Wed, 27 May 2026 15:53:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RFJH06879279
	for <kvm-riscv@lists.infradead.org>; Wed, 27 May 2026 15:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TjJldvT7FSi/xrhKmKtEzNTk
	czqnTLHADBywYWMgN28=; b=gQN4r0ZgLx+XsiOlcrE29Zz5Vl81aCXbacw27mXF
	g38Vz5TPdBTqq+ezM9Jf7bCtfCTz1kxPsnUYUkLf48k/abCqUCQrHWtbhPVlQEqf
	S/NcU/DuplQEWDep45FZIH+6ITPYc4gPCzJouApBCxxZ1Oxav37U0uRWN0MQ8mWf
	FDe5k4SXcHkDEt1k1bHURNPehZHzxk+CIcmtMiUFZ/6phyOOcxhmdflMHqONS+vD
	pTWCS1Un93n210sb0A+nlm5ymKWcVVZPDBKAPU65ulveECcn2RIycvskDx1bpRCD
	EjcbLuK91uAuMKZxxV8NL23EmOhCgXqqZVjJDLOl1vUkEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqssvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Wed, 27 May 2026 15:53:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3041ab826ddso11288267eec.0
        for <kvm-riscv@lists.infradead.org>; Wed, 27 May 2026 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779897213; x=1780502013; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TjJldvT7FSi/xrhKmKtEzNTkczqnTLHADBywYWMgN28=;
        b=ZtxgzILxezxTr1srPmJMclk4Y+CnAyNk5XcwCrtiHklrZVz0tY2VHHZ6VtIQMbklGi
         dr39xuh20nkian0Xp6XH7K3hdy8gUPza/eKo8s5ScEkGV5m6r5S7ZFuvbcJCumic08Tx
         /w0PwxlWMZhEfBN5x9izzQb/S3cGCPnOu33SwFxgsOCmTy+m8tz5/1jXkBjCovza3HTh
         5Gad59NcbCKmcSMcDFN9aIBD9HJHkVs7wKiEurAu8BiEHJhTxQfbPnaohEhhw4vhxZYS
         qxpFwLxU8ZA0jNm327MBOm5SrzblCbUvWuxXAlLBel6qppCnZ+zBEDQHWAM//y9Ab9Mq
         iG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897213; x=1780502013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjJldvT7FSi/xrhKmKtEzNTkczqnTLHADBywYWMgN28=;
        b=jk5PQvzZbvC9PxKP5LVTaihp+/pMqJxGCbwqLHjuBeX7CVCeT1BDgeNIU6CVZCLe0U
         CETbgMqxW2Ai2LRkmFesIWAT64jj3wChCj6V9ZWXzqAmnwDLU2lJxZahjs4m+LWniZlW
         MYwBF16SwzzX7roOLWhHMwij0STpGrkvGv4iG45w6fXbUQov/KliQeK6XyhESZI52FaI
         6EOGKZntoXS6ScVVuaT0YLOzT50Emm4of1aUi5flU9DpOFb49rzHXegUyveI0tC0yMbC
         O4YkxInhpUSg9qW5e/ni75VXMYAJWd4fanGexU0EkDlhYSTYfKDOWlB7U6D31l32GIb7
         kxLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XQyXa7MFTu+DzoG6PXPBH58dbJyXvyOQhI/z0Yn1ZUTzaaF9Qn0R66ZiQQI8qkqJXHV8Cit+siLA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3uvm7ICAtVUHX+LpTq+pOBLs/YAus+2AeUc4/RAxmg/QAgqwz
	S2wmVUWAI5M6JZ3HMO9k3Ws+eiGv7HwOrFT0sMv+b07PV9fZtEzZIsei3qoFyYHHO2Yn98PWtOl
	4VruF/deYc76JwwbCrER0Gzu1uFd8FZ4czcmceAp1Te58rkEPPc25sxf2MCm3YN4GFlPL
X-Gm-Gg: Acq92OHPWqJS2yuNRyrjWW6/sV3ZNGINAKCSuWguQrRigiv4SMiAgBPHe7z+ndP1ZQq
	xAiP/qPuTcE0XnAiUcBAhFKT637mtat2hTYICyeS/M+ML42bEbc176H8ZFxodG938hZmuAmLFPh
	X+JxGuBAGf1Anjro5l3eOMvnBZtcSJQN+/p6WADwe6xp7tNuEj6Lrpl0MB0dVQHbV3L7+8p5sXf
	Zy5ZmuARIwJRjxcJrpLJDdWUbFkmdx4h9geZuElbsZWRIoDTWkaJKDSifq8cDY7y8T+tvpxqFMB
	wsLZBfDbaUZ0ikusdMbJ7Qpro0p1ZDc9qxycECaToDuKt0krPhJhlYg52WtXdcOU8VOH898Kvqj
	h7MPbczHUtBpTQhX/0iZPojaKadSa1us=
X-Received: by 2002:a05:7301:4008:b0:304:ccdd:594a with SMTP id 5a478bee46e88-304ccdd6451mr477566eec.5.1779897212919;
        Wed, 27 May 2026 08:53:32 -0700 (PDT)
X-Received: by 2002:a05:7301:4008:b0:304:ccdd:594a with SMTP id 5a478bee46e88-304ccdd6451mr477541eec.5.1779897212336;
        Wed, 27 May 2026 08:53:32 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef3273sm17889766eec.2.2026.05.27.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:53:31 -0700 (PDT)
Date: Wed, 27 May 2026 10:53:30 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, Jesse Taube <jesse@rivosinc.com>,
        Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v2 04/10] riscv: Add Zicclsm to cpufeature and hwprobe
Message-ID: <ssov52bc63wlfnrcxbjt56wi2jxl6yzce4lyerwkix5p2xlgri@r5tjrax3nfnc>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-4-21c5a544f1dc@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-4-21c5a544f1dc@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1OSBTYWx0ZWRfX82p3DYQZuut9
 iIBpUjRQ8YDal0jLBM9Hh7PSDZOf00Zmmg8HLlYMwszvAGCuAZBPGiY1s5z7S43UgWQvojaXk4o
 5XoXOT9VUImaE2H+IZ45b5EKBouFsBb4GFpV8mkwP6w4ssFVYl4PImuUo8mQ+HMVnNCBPcoHZOu
 J4bUEDc4x+t3uEZlfIRqWkXhK6nwGYbmVvnrpsiUbYt6TXN3HTMjJZeQ9SN20SukCxp/atYWzP6
 nxj0ofrUQFGW7PhMuoZ/U0cX7ue4b8mGPXcoIapffw/jUFX0g6Y9TkwAfnt4f73xNefDDOz4t7H
 2qdEY/Q7Zb2xGrYT/MMG3XNLm2mfPJM4zB0n1Nrx1AjNbD4mpzAY+HqAmgLzSGYHVhwBL+gbJHa
 mfrPJOazDveZrG8Av/05pigvjtpTCezz13w7J06H5d9HztU+habiPrS6/xwTjbEr+FRjiHcePJI
 8002UfUrKbIMBmN7YoQ==
X-Proofpoint-GUID: qHjAS6Yv1aCz_KrRK63i5nadPzt4nekT
X-Proofpoint-ORIG-GUID: qHjAS6Yv1aCz_KrRK63i5nadPzt4nekT
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a17137d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=ee_2aqc6AAAA:8 a=h0uksLzaAAAA:8 a=XYAwZIGsAAAA:8
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=x1z8LLhTheR_cLHN9ccA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=VOpmJXOdbJOWo2YY3GeN:22
 a=MSi_79tMYmZZG2gvAgS0:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_085335_438664_6601C753 
X-CRM114-Status: GOOD (  28.07  )
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

On Mon, May 11, 2026 at 09:34:49PM -0400, Guodong Xu wrote:
> From: Jesse Taube <jesse@rivosinc.com>
> 
> Zicclsm requires misaligned support for all regular load and store
> instructions, both scalar and vector, but not AMOs or other
> specialized forms of memory access, to main memory regions with both
> the cacheability and coherence PMAs, as defined in the profiles spec.
> Even though mandated, misaligned loads and stores might execute
> extremely slowly. Standard software distributions should assume their
> existence only for correctness, not for performance.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> [Rebased, rewrote doc text, minor commit message revisions]
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> 
> ---
> v2:
> - Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
>   allocated a new bit for it
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>  arch/riscv/include/asm/hwcap.h        | 1 +
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/cpufeature.c        | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  5 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index c3bb26d70c748..05f746061f679 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -289,6 +289,10 @@ The following keys are defined:
>         defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
>         load/store pair for RV32 with the main manual") of the riscv-isa-manual.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
> +       as defined in the RISC-V Profiles specification starting from commit
> +       b1d80660 ("Updated to ratified state.")

Sashiko[1] points out that now that this has been moved to IMA_EXT_1 it is
no longer the correct location.

[1] https://sashiko.dev/#/patchset/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc%40riscstar.com

Thanks,
drew

> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>       mistakenly classified as a bitmask rather than a value.
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 44bf8c7d8acc5..e8f4a7dd96a93 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -112,6 +112,7 @@
>  #define RISCV_ISA_EXT_ZCLSD		103
>  #define RISCV_ISA_EXT_ZICFILP		104
>  #define RISCV_ISA_EXT_ZICFISS		105
> +#define RISCV_ISA_EXT_ZICCLSM		106
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 9139edba0aecb..6819df159c51e 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -116,6 +116,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
>  #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
>  #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
> +#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
>  
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5cf463570229d..4b4a8157277a3 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
> +	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
>  	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
>  					  riscv_cfilp_validate),
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index f8f68ba781b45..9cf62266f1890 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
>  		 * in the hart_isa bitmap, are made.
>  		 */
>  		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
> +		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
>  	}
>  
>  	/* Now turn off reporting features if any CPU is missing it. */
> 
> -- 
> 2.43.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
