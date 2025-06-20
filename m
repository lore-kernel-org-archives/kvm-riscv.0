Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23E8C7115C
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6EhoIVfnrQ+CiqSYFwIVZPeOT536BB2KCtwxIsnvNTM=; b=LuLCes4oI6TzNF
	8Lc066t1et/OWbI+qgpY8zS/+5kGIEDpggcffdvulj5euEji0AsX4UChZigezNfxO77Kv64OrVNH3
	jYRBEbRT3tiST9WdwtOPYZUtMCyJQ+8aPqKaBmHHbAfWpBqqo09dpxkbGPcbWXMp2tKP/tJa11uZt
	+tsbbbbtFm2NM9IFW5hauDyQTxXzzxHJkXAV+qpn8dEUO3bfxqlh6l0C7LPVGPMaR6z8ijNyliaS6
	9RUcWfDNThQbSyztw0q5V8RwPkJSsmZgzq5kHSnVEYUu5mnOUhgxFG9RUYl+LXdQWvwNb3PYXQSbK
	i4O+/dT8JMQE88EaGTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbJS-0000000Fc2j-3SRZ;
	Fri, 20 Jun 2025 12:57:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaU0-0000000FWvy-10Ls
	for kvm-riscv@bombadil.infradead.org;
	Fri, 20 Jun 2025 12:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+XeTD7cN51Pn2KJSTE1mvF0ehQNPT1Jdjz2pWXS0RPo=; b=HP6Ht2zZjurwwIR2MTqmjjy01n
	rlfIuCKWSPl3RiYRvqg1WBLXOGZuVHDWqc44esy1HZ03KTWdKxiwr71G1xhotgtvLadashablAssE
	Ks8nz2YdQI1WPxWUYv2sJ8SYIKbXzw2+jc2D/TM1koFST3NzOwALyEayDzil6yXNNypHuFLufdq0K
	WQHsyLQ+MPFJpOnGh0rhG+VC3LB8BFaRgaKrvAt69NLQM9u4a3CEvpexsX0wlmoVjNe/bb6V4Y22Q
	pVQHlXe7wj6yH1quwPEjuNdzv8eydBzkKmtxI/0LdP11j7HggAObVl1avuN+J8DpUg4Lf8UQKAeQ9
	Y7Xn1C/g==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaTx-00000004j2H-2c9G
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 12:04:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so288808f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Jun 2025 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750421071; x=1751025871; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XeTD7cN51Pn2KJSTE1mvF0ehQNPT1Jdjz2pWXS0RPo=;
        b=a20Vg2EpwDsTjXumuOOW2z1CYQiCqaJ+RkvE87V5OFbZ68swpjKzYSNnvP9iA/o2Ia
         vHjepT19ki3+MpDzStfa8SJdDT6IZBjAm2Axdwh6JMKvcWmGShQ68zObmahSwcoi5iCl
         AeYh5CVgExsEIlJSF8Z1co8FiYq+dXZx1YzcYs9crkW1pBEsbJeONaGEb1U90X8K70Bc
         loBtgF5ftSVsKDHQKaKfwPMeWWbDwzx+pnWf9rKDJ2BrMrzIkFGo+PyodtkgUM0UN+IN
         P5GtEhoEjMxWAfb2/Q8BWIdkb+rNZ9ibXVFGeLaFtlfxJih2OPMmuZKlsTDBFgNJ9MM5
         MnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421071; x=1751025871;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+XeTD7cN51Pn2KJSTE1mvF0ehQNPT1Jdjz2pWXS0RPo=;
        b=iB0UWHJZKXFAlOPd8jjoUGuDn6J1CwrzLPIwU75hwtfGUD0To7ADescyMLi/yuY5Kw
         rTXhjUFEfCcvWG93xKOTAewWpJmTneQXfePy+KAihQytAI+Bh62jrY/Yj3DqzA8pCFW+
         pFliGv8NTewe6Wg4zY3QTchhVIWEPhh2Swh9X0ZqsTsqnI3vVNCub34uJohfRTp/WZAV
         tIs0Nflf90Rv/nwXIUk1/FefTbbkCwT+Ihvj3s4UXestDS6nzzxHx7+j9M38Hq/kopKA
         p4QkrtgXkV9twRcau/tMvAVwx0QXG2la4mdLcvTG9tZx9qXvpNUcJTETPjnlI3tQnjma
         z5vw==
X-Forwarded-Encrypted: i=1; AJvYcCXXKGIBcrdpcfb1xPMA++d0Zq0qm0YEV4JNzivqYL0xNpzuWXgIxr8PE8PmLOw3htv1WeWoLvwGLy4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx10BMoeZ+b3b/Pv6NNIzLE84Se4ufKZRTK4oTb4IJ7K4yo7nrv
	8Nkn83BT3lYNKWsCo3TpjG42hka5vC0tG1dU6SmOu8HZ8BVz+gOVcLnmHqo3+FLnj5s=
X-Gm-Gg: ASbGnctm0wTvhp8tLxfbu2pHN/47hUHNEblxG5Y7EfmSDkE4ZooVvm60LQrBE0OaMfC
	dF0dMH2di2dbz44oESMhvqn1jfhqduq4DqEjfRzDrtgmhShqffEDDBH3Xtr7mBHaBflBRfEDAqw
	p7v9K0CLWCigaspgn6UZ6wYXwfhAQGncATkkqZqBCLbrIDgyseIICJz4TxAsU53XqRhC5VZvR9P
	qAf3bbqh892WX1NmIgvOYlUvKR1a76ZFzLNf6QwIsgdK5rQMd8IJN4De5MwfdFpQOkhnFWGK8vp
	kqJ7RpVfUGy2nEAH6mJr5xlObbA0ikN6De6VO6SYrZ4S4v8+++7Mh9PcalAjV4K33XMm
X-Google-Smtp-Source: AGHT+IE5Nwx55CYVDH94kaBUPm5U9VYUEHy18TPg0VqIF2/T7Ln2PcZvxS2VOj8pKTt4zB2/NGi+iQ==
X-Received: by 2002:a05:600c:c087:b0:441:c1ae:3340 with SMTP id 5b1f17b1804b1-453657bf6camr6628245e9.1.1750421069056;
        Fri, 20 Jun 2025 05:04:29 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:81c5:fb37:d08e:99a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a5fsm57299655e9.34.2025.06.20.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:04:28 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 20 Jun 2025 14:04:28 +0200
Message-Id: <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Xu Lu" <luxu.kernel@bytedance.com>, <anup@brainfault.org>,
 <atish.patra@linux.dev>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250620091720.85633-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_130433_814251_11C4C047 
X-CRM114-Status: UNSURE (   5.89  )
X-CRM114-Notice: Please train this message.
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

2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
> Delegate illegal instruction fault to VS mode in default to avoid such
> exceptions being trapped to HS and redirected back to VS.
>
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> @@ -48,6 +48,7 @@
> +					 BIT(EXC_INST_ILLEGAL)    | \

You should also remove the dead code in kvm_riscv_vcpu_exit.

And why not delegate the others as well?
(EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
 EXC_STORE_ACCESS, and EXC_INST_ACCESS.)

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
