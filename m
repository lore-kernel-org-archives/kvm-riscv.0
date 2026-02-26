Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A72FD8FC3
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSaQQUguddHLAFOWP+nAYnmbyLOIOlGigD4MMu9Ey+g=; b=UoPJJ47kO5GfFi
	uOt9Qvc8nw9bOhQnsW8+0ppQ0r4wCrC6hNwS1waktVh0mtVumrD5U+PpNdKkQShQAJSc2ld3IvHuw
	/ctIBFNOfdTVJgcOrScygDz1UkGIKu+Di8uQldJSX8+VPRjrkvJQ48YQ4TqU2/sBDTEXMsRVkWvoD
	npcMu4idDFuNtkggVAfvRih8+wQWKb9DFMi+WivcE6Ozet7DxlcluZwFDy4ZX5DqXI5bNMQbeJe7u
	Hb5zOEle/SylFtK4VERNGx+V2sbhhKVMLeHNNaVzRAvqOZuRsyx10ZnsM+K3GJZQpRPePDMYlWWfE
	dTNTlKOMYsv7HMWfBdEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcv4-00000006P0c-285m;
	Thu, 26 Feb 2026 15:04:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcv2-00000006Ozr-0br8
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 15:04:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL39C369074
	for <kvm-riscv@lists.infradead.org>; Thu, 26 Feb 2026 15:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qp3TU7bzUr1B0vZ7uPapTlnahGO7pQVMf5jftO4wjJI=; b=GzGEF53SIu6p5rL2
	FSzlRnRl/1ny7hdPTi7cfN1pijd2a8AUO4dm00PcTez3Uq4OMf1cO2K4EigAUEJm
	9oZ5mw1R+zCmREzqwxByTbrKpVLrDX8UtHagBJ4JjNSHczqKXEK+L9aRfz5s8c/e
	PXNZKU6e8gR/51X5T0nwNyiO2/GLfVpML2nvU/DEE3kv3Z6TNeSX/OaoXVw8ZQu5
	3W9Cz5+M/wN6wq62tYf91lyVqwlmfyV7C8qyZ3ePUzRjlx5CkB4XsYEYFD7VneQy
	JvelPj8eN/8bsDXt/swz/lt7ZUFonpXnhSvP+Pp3mr6p1N2is5u3j8ECBgfC/XOY
	QmSXEA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj8bdaxe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 26 Feb 2026 15:04:46 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67999892f00so20791642eaf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 26 Feb 2026 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772118286; x=1772723086; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp3TU7bzUr1B0vZ7uPapTlnahGO7pQVMf5jftO4wjJI=;
        b=WzWhumxwYCRFfXHk9l+VV8n25O0ewUbBcOOUbDL/C7EcM5nt0XUdt73dgmPtpd+x2n
         nK6QGdRmfWQyGK2x8zS/fxbNEAe5GqK+9ZRf/xXVoUuFcCwDsMT9v/Jn2Y67A+dMdU35
         KoCeEOkzl7wywU7+7AAp9bgquiAP7A+su+eIZzMd/6KVkTYkUT8c2Mnq1bguo39WGCK1
         16pJGroJjttuYNZ9JnKgKkY998C9jQLvQpKnYXBQ07kQ16LiKKoJEDOCPGHkyseMn10V
         mujIY/EaWyEUfwJWoBD1VsiP3yeiKx09Uf7F2FSnARZwVfaSsxkuoQPj1eDjdON5m3TO
         jAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772118286; x=1772723086;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qp3TU7bzUr1B0vZ7uPapTlnahGO7pQVMf5jftO4wjJI=;
        b=bYUu2odyRe+6eYjUL+Z0z579pNa5M4ljD2z34DWd9JVgyLeojN0x7KxBpiwZZKH9j5
         0Kzr5KebPZGJro/PkgDaA7RlsmS+JrTQDWybs7A3p1m3V2lnYfFGOrM/z2yLBVG+5PXC
         rfWLyR/C4VSyAhAinccBM/RyCTNqNZPAiEHF9ZZ6OSD6Nw/An2Esxvzj7OPfTYKpVwIX
         haBEUB7fCtT1BO4oqdtjPMUAwaMWJwb8F6jDmG+jq3LAn/kSZTHenaKUEU+37EIO5TBy
         0gDPdUx8FtDSjZk0QCVXktruS7EHHkPpmRWdJiiN+GKXJrV4qVZqqm8WLxSEcmVK4WNf
         QyMg==
X-Forwarded-Encrypted: i=1; AJvYcCVL3hIgLWrWB7iqC8Z2AbnK5wGS/AoBEctbhCdeHuH/o4xLtSqSk8PUBY83oA3zwFBy0/8TPakvEyA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0gFscLTyTC+3ns38X9MvSUPoL4fNocboYuiydc/gKLD3s5Yz+
	vOn2b3FflO/wDqgEMwG2lqFlaSJSjNnj6vrR/rKDs64fAxcYOVQceEfbcZrVJSzCShfE9DqFlBk
	feTEq7gXHjqZggCGDBHGxjuFNm3n6r3XHRkG5QnR7dioFUyPIhKYF/fyf/6jeaOWCsFzl
X-Gm-Gg: ATEYQzwPrEvxQeRirBnmX6AqfN442KWsM5WAgh3lAVbpP0cpVOGzZ+pdGvZ7j3H4Hob
	M2ueehryX5f8Q140keolSeldNQaPoSGxF4tTAAOaC5S8IzJMGtAOBm1fzCK3XAOPnyaNy8r/Jt3
	4Kr33NorW+BeCPiTPVKODtmvDe/CuPlEB+KfYS53E53Ipl6X/Kstn5rphuqwRF//gC5LULiWawl
	8EolPCVXb1I2cQep6ijPOLUtcoWb2nBvNI7Uxsj9I0+KGJmY0PJwK/vG4Pzln7e6OlPhNZJaBUX
	S1x7FfMra129TfZgutk0m0YjryVBlojFxjcpqEoVrLoPA9aQMktvyQkmuWHKg3dHnGnZpzpzjmR
	vqVq2sJ6gjw9XHILbrk4DW4aUVEeVHz+pK1xJOx7sEI9YP0qSEP8vQgn2Bw8/
X-Received: by 2002:a4a:ee84:0:b0:663:3c7:421d with SMTP id 006d021491bc7-679ef9b9587mr2113795eaf.75.1772118286069;
        Thu, 26 Feb 2026 07:04:46 -0800 (PST)
X-Received: by 2002:a4a:ee84:0:b0:663:3c7:421d with SMTP id 006d021491bc7-679ef9b9587mr2113774eaf.75.1772118285481;
        Thu, 26 Feb 2026 07:04:45 -0800 (PST)
Received: from localhost (ip-86-49-242-13.bb.vodafone.cz. [86.49.242.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae6131fsm65716166b.40.2026.02.26.07.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:04:44 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 26 Feb 2026 15:04:43 +0000
Message-Id: <DGOZI4Q6NSDS.7AQVQ7TEK9QH@oss.qualcomm.com>
To: "Jinyu Tang" <tjytimi@163.com>, "Anup Patel" <anup@brainfault.org>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        "Conor Dooley"
 <conor.dooley@microchip.com>,
        "Yong-Xuan Wang" <yongxuan.wang@sifive.com>,
        "Nutty Liu" <nutty.liu@hotmail.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        "Palmer Dabbelt"
 <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>,
        "Alexandre
 Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v6] KVM: riscv: Skip CSR restore if VCPU is reloaded on
 the same core
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260226123802.154855-1-tjytimi@163.com>
In-Reply-To: <20260226123802.154855-1-tjytimi@163.com>
X-Authority-Analysis: v=2.4 cv=FKQWBuos c=1 sm=1 tr=0 ts=69a0610e cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=9tUHzIdeCh+UoOnba06Qjw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Byx-y9mGAAAA:8 a=E61YY4l4AmgQ4UnPY0gA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: qUjo5FZtzBfCTMevl3ZtHTAVSeaFwTN6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzNiBTYWx0ZWRfX3czBP+wvVnsD
 DgS96dHrsgMkC8ZHiCHRi+tz7DA8CQ2rltWyP9px3gWNeFFVDUQ9l1S2Cq99mXdjS5/ApZ+hApP
 oFA7r+TY4Jvl/3Hvlk7PVzoeD7JiZ6rnlD06Bkw5eGSy1uNznMkkUibWF3aRMo1CQTzMoDQiCoQ
 Bj1378zhzYHiHEG93k921b3HTT00O3e2IR29MiGpj/IVT9gVpasGYGug+HUyrs/DLo83WaGp5Cj
 ICdnGGq8B1ewwSMbcZRByhyUCp9Hhhw9yX61zJkX994YtIvjgpLhoGlGVlOWcJbPfMouo6RalMn
 OmFB5Dm24rXesx1K3h8FpJxQvAHNr7QUGUPuq9n8eFUUXVcfOdiQgxff43xNE/Q0YobjlkXvMJS
 PvvvFivv7wPF3p97bTuWzmMg6We6XjZeGEgMC5hh6qrX4SyyUk4OkIBY0cO3KbpGdtsUINBm+1R
 jG5QqcpE5hkTy9WFIRA==
X-Proofpoint-ORIG-GUID: qUjo5FZtzBfCTMevl3ZtHTAVSeaFwTN6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_070448_186897_AF312655 
X-CRM114-Status: GOOD (  24.25  )
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

2026-02-26T20:38:02+08:00, Jinyu Tang <tjytimi@163.com>:
> Currently, kvm_arch_vcpu_load() unconditionally restores guest CSRs and
> HGATP. However, when a VCPU is loaded back on the same physical CPU,
> and no other KVM VCPU has run on this CPU since it was last put,
> the hardware CSRs are still valid.
>
> This patch optimizes the vcpu_load path by skipping the expensive CSR
> writes if all the following conditions are met:
> 1. It is being reloaded on the same CPU (vcpu->arch.last_exit_cpu == cpu).
> 2. The CSRs are not dirty (!vcpu->arch.csr_dirty).
> 3. No other VCPU used this CPU (vcpu == __this_cpu_read(kvm_former_vcpu)).
>
> To ensure this fast-path doesn't break corner cases:
> - Live migration and VCPU reset are naturally safe. KVM initializes
>   last_exit_cpu to -1, which guarantees the fast-path won't trigger.
> - A new 'csr_dirty' flag is introduced to track runtime userspace
>   interventions. If userspace modifies guest configurations (e.g.,
>   hedeleg via KVM_SET_GUEST_DEBUG, or CSRs via KVM_SET_ONE_REG) while
>   the VCPU is preempted, the flag is set to skip fast path.
>
> Note that kvm_riscv_vcpu_aia_load() is kept outside the skip logic
> to ensure IMSIC/AIA interrupt states are always properly
> synchronized.
>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> ---
>  v3 -> v4:
>  - Introduced 'csr_dirty' flag to track dynamic userspace CSR/CONFIG
>    modifications (KVM_SET_ONE_REG, KVM_SET_GUEST_DEBUG), forcing a full
>    restore when debugging or modifying states at userspace.
>  - Kept kvm_riscv_vcpu_aia_load() out of the skip block to resolve IMSIC
>    VS-file instability.

Excluding AIA is disturbing as we're writing only vsiselect, hviprio1,
and hviprio2...  It seems to me that it should be fine to optimize the
AIA CSRs too.

Wasn't the issue that you originally didn't track csr_dirty, and the bug
just manifested through IMSICs?

> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> @@ -581,6 +585,20 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>  	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
>  
> +	/*
> +	 * If VCPU is being reloaded on the same physical CPU and no
> +	 * other KVM VCPU has run on this CPU since it was last put,
> +	 * we can skip the expensive CSR and HGATP writes.
> +	 *
> +	 * Note: If a new CSR is added to this fast-path skip block,
> +	 * make sure that 'csr_dirty' is set to true in any
> +	 * ioctl (e.g., KVM_SET_ONE_REG) that modifies it.
> +	 */
> +	if (vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty &&
> +	    vcpu == __this_cpu_read(kvm_former_vcpu))
> +		goto csr_restore_done;

I see a small optimization if we set the per-cpu variable here, instead
of doing that in kvm_arch_vcpu_put:

	if (vcpu != __this_cpu_read(kvm_former_vcpu))
		__this_cpu_write(kvm_former_vcpu, vcpu);
	else if (vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty)
		goto csr_restore_done;

This means we never have to read the per-cpu twice in the get/put
sequence: faster put at the cost of slightly slower get.

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
