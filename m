Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E440CA0ED1
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpntASk3WLa66UBbl81wPRI3EswQcSDT/1GiB1nAe1Y=; b=wKbr6tEgTLbOGY
	7DByvSJG+SLcExv0E59E3WuKTFFTTzoGGF7GyKTcq+K/CCMA5SeJpUCNtqs7bSx878MwFhM64EtfC
	ifvQawaDpxpVH6fI2Cd5q8KwIdfCKMoi1YcA5xvjWlya3fok/UNSKjc994jCmUPiaHnu1sPMgjtuu
	XgDlYZDSa6uQkRUy0fL2PAd8MMY8k/ADUrO+nYHUUxDpJ+OXHGQ3D6dzlCzkuCg764ZT6wr53O5Ne
	h8zcowcQyc4XHcFHnYh7t5mZirnnVFtr2alRJORMxY17iuYhwQxZMcvmQ2DW0COMEZghf2ERClWNN
	euHerm5YS614Hz/wWIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0sq-00000007kyK-1hYT;
	Mon, 18 Aug 2025 14:30:48 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0ne-00000007k0P-1EeH
	for kvm-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 14:25:27 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-88432cbe172so28165139f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 18 Aug 2025 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755527125; x=1756131925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FyQYJ8E1IoELk0qTlvKHUstdV7nwQIqLjOnOuTovC8w=;
        b=b0aSvsgLWsF3EQSjC6Xw1QKp4FE92Q37/ybMa9OVm8TtO2WaZLuHOxuWTlO7jKeHej
         6ndhkhfyf/XTo3okUSZbpeuJHl3lv5G/zdz5kgupdt68TrlhHf91gi4Bmw1dNVdahw50
         ud7tPWwbpKzw3QBcEC887kYd1QjaSwf2Gcn92/ELF56bbd9EbClx5/o5UoL3bw6NA52M
         VOKEMkcIX0r7nKD+4t3RRxpK3EAPjzIjLMbydloeJyNwkJphSo3OUE+/Xx53UWCYo7NU
         YyZbIt3Hv343jBvD8kBCc2Ih+td7KLqEXfbcUgcFKna7wlytn0ZCM0PP7/YVh3pZeC+Z
         PScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527125; x=1756131925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyQYJ8E1IoELk0qTlvKHUstdV7nwQIqLjOnOuTovC8w=;
        b=ewYqUf1RxIAmU00ZKEtaRYDjpmNVdLspU+7WCy/dPkn7tLKL3hfc9VQS+MnQsDNRGe
         d0asMZghiN0dda2/G1w+z8LArvl/2buNdc28jsQNUv/0C2mv5+fxzSGlhLoLhzjBlnLh
         N60t1QWMQ0Fpr2Zlolya7nGK0F23buf4VKyzMcXQpdQPaGtUpcK+Y6gpNmtHQzLAbBHF
         /C+zvXGWVdIQIGqYNcHaK5DmU6az1hivUYMSQyL6Kd9uJ3rWoBvhuEu4NPrZmeehlVYk
         xRFeR+FFt2pDYzyLkQI0vk/Wpk9gnvJqjPidfWJrcULvEDMQsdXsF9nrYgMYhf1yScfq
         es4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYiLedjTn+6L1MtO8hLwmo7zh+4y7z8GKOpzkkFErCrYBCPrGxh24n1YLmKG9XmvzoC4d8HObsfxQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyN2IG1f8uuHwKdcnahJAcEux3WkKi9twgqRmqSSNhyFl6SFvtv
	I+alUrm04A1lZ91RCEe4ts89iRQpXnL5GK7FItybUZdsB1bgozSol9ACa7DHC92sZz/v2BEgXoW
	i2mP5gNE=
X-Gm-Gg: ASbGncsfzXF+vvChI8x0j5MfYpl8E5pKGhwTv4tJp+bU6KH5rFwIlR5zU4peqyJmgm2
	Dc6bPeOBFmTs3hfQ3xuS075hA4jqnBuH5XNYsb6OfJR8aEUKabyyQ740Gl/jeU5AzzavNJBlTTm
	kEx1lc4LspRujH6ZkQq4VTKUfa2B51Mc4TNPc8pJ6OHyBvUXdFDhyRmpVfvWPY4f2pk9+WCcdd+
	5qW2jQ2ubqBRD9q2B587Je9mWEAuYJATiRUbJdnNI5OAPXCia7ikTgpfhF9HWxvg3nh+Lk16rkV
	IVvcvu3wVOECQo5/qEE/M0Bb+Exirb0hcIjvGUc1d/PAI8zEdusuSz1a/Ius2eKVvF0M8PwhT1N
	d8kpQOxznx4a02c6+jcEd0Ovq
X-Google-Smtp-Source: AGHT+IE64bGylTNTCod6VJPB6Kdqx/YvIcxD3l3x6WiSKJyPUG0tS+DbyXFafnmRow5N9BI1j9Ev6A==
X-Received: by 2002:a05:6602:1687:b0:881:8a24:55c3 with SMTP id ca18e2360f4ac-8843e36de4bmr2011895139f.1.1755527124401;
        Mon, 18 Aug 2025 07:25:24 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c94999fe0sm2564173173.57.2025.08.18.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:25:23 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:25:23 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: Correct kvm_riscv_check_vcpu_requests()
 comment
Message-ID: <20250818-3808a778aca8606ddd126ebf@orel>
References: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_072526_340028_703BC3B4 
X-CRM114-Status: GOOD (  15.90  )
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

On Mon, Aug 11, 2025 at 10:18:29AM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Correct `check_vcpu_requests` to `kvm_riscv_check_vcpu_requests`.
> 
> Fixes: f55ffaf89636 ("RISC-V: KVM: Enable ring-based dirty memory tracking")
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/kvm/vcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index f001e56403f9..3ebcfffaa978 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -683,7 +683,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  }
>  
>  /**
> - * check_vcpu_requests - check and handle pending vCPU requests
> + * kvm_riscv_check_vcpu_requests - check and handle pending vCPU requests
>   * @vcpu:	the VCPU pointer
>   *
>   * Return: 1 if we should enter the guest
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
