Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36001CA1010
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 18:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgmytLzx50Y2yQ9p1ixqbpCBBAwCbJNFo0UYrsR8QJY=; b=2TzeYL0jLNlpR5
	7YWCgotBjyAt2nbXcgQZ+FDimuXfsiXXgb5SCRlaiA6jycoyg8bM5ZC9tpziaK0ZnxK3SBZU5aXXn
	S1Vzz0MzMN8Uh77HzqjSif4qgV+KVRZM3Y9M5XMIpT/WC/to/oY/ZBaid9MRCgSSJeaf4dDDsFYL2
	MoUVGG7r2alVM4XsrOYo7gqGaf58ZRWfhRUZOMDmPe5LW63kxX8LcI3HZ4SRVw1QQLYr6aBjtZ79K
	Z4V+yUKW0tkoGvSepaGSkP8/1CgPzFT8hxlF46bTghjqqmbIkerAqAFriAT+0MnWKJhQ5kS+w/oj8
	J5xwMTujfyXqJGE/2S3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uub4R-00000003l2y-2EV3;
	Fri, 05 Sep 2025 18:21:59 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXK5-00000002FPA-43L0
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 14:21:55 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3f663225a2bso15593645ab.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Sep 2025 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757082113; x=1757686913; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WAIXNF/yhxj3WIda95HMOmBhnbf7MpGftHHpVlcqDy4=;
        b=UwF9Fy0pC/W9M2qcGRMy0CeYBm6WO2gWKUp4xPd+DGvf/CZVOz5IDZIDwV6IsAfq90
         0Tj++FNdhZzU3A8xHUVmclV50Nj0FIxKTc6wxl9CPp9hM3RsO7NCMSR6FHUrL7diq5ss
         RHjtHpih9XEe7UiblJc03wBnx43WRCxxAsGTLmy/3j5Gd90U7hwRfm54hPfliXyPw9SR
         tg4oRT5X20EXaX6KixDY4+rRUiuInvtcysG2zT4u144qPYPARU2xSXKviOPGDyu22wK1
         bb3tMQ/ewjlrZd7+hMATJECz19jwbUmSHRjUKpvxbgrmIXEIAyRxe+oFvVkm3EqnkNZ2
         OMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082113; x=1757686913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAIXNF/yhxj3WIda95HMOmBhnbf7MpGftHHpVlcqDy4=;
        b=dYRtCIP+hfodziSK62NRHm5sYHG8GYuBDvXlsWn8e3cld8DCIjVXHNcrDqQWzpDQv5
         yRkMgoohw0c1RQf2J0C8Bjqvp0i5evV6VKT22FlLvsojri5/siF9Yj4SCQtFXzm7ZZRF
         r57hIuarNBJgzZjotJug422H5Pa1qrrzHg2l8HuXydYTbY64Pmhewo4i1fjTURECV9Zm
         hQbYL6kfHizohpFofrNcZvKZvptJi+EB7sWhW2YPyofqCoqiUUBzs2fyLD8jmcEQZ5bv
         64NJDzNIP9SdiJAzbr8F5x1M6Fmdcu4NjFShgGGAsXcbp3pplX34Rw41v1VXOyeq0Tjq
         qkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb1bq+tHLZsPtQlXgUQMwACCmDfrtGWeRil1kEoXvzvk5ZEIjSWXDzFQ7idAoPWtz+59W2+xiiJio=@lists.infradead.org
X-Gm-Message-State: AOJu0YytJapkSvRhDX8iss58thIqk1lxzAHB3Bf6Q9dqiuaQmmLdDKfV
	4NrMH9yaD4Hgfzj4pAIA+SIhXlEGQthJ5wgcmGpgu0we8STnfrX76F/4dJEjpUWVL2I=
X-Gm-Gg: ASbGncuctGxr/i+BqJnnkG2Nu8ui2c0vl1/Y3TU/l2OyJZdImvtumlLdmxOvyb1Iuj6
	dkpAqpC0p7KTe/+djTDNR4uL7m7IvzX10Zga9YHEEqk9/QPzJn8y1PdTVgqzg064vuXogV/oXEc
	+CYTs1YGnJt4/P3Cq9hT6O2eDA/MEibTg6wwIq7VQr8Bn00t+PNL4HQXkGqCJzVDLMQtFvCIf+e
	yjkcj78OsL0UyJDF0fRMnBZfMjnz/4iWxcWP0wujGP8OrlkrCYphnTwRqBfS9mHfV9AviFOxCuX
	/XAHxgmIwBKX8/GYodVxlA9aYC3RJQ6n8zzRWpJUrgIIDiSqWeJOcy0LfkFnkEsKQJdvnpUodLb
	kpAVGWVC1benFeG+WJA9HfGTY
X-Google-Smtp-Source: AGHT+IGf4qxxSXO6iewjkiZTlmr4yvaEZFX/IytJuUl4Nj32J40fOreM/84N8MX0m+sgaZr+dqFiDw==
X-Received: by 2002:a05:6e02:240c:b0:3f6:6198:b39e with SMTP id e9e14a558f8ab-3f7b6808028mr57130415ab.0.1757082112699;
        Fri, 05 Sep 2025 07:21:52 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f0d594fsm6185353173.23.2025.09.05.07.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:21:52 -0700 (PDT)
Date: Fri, 5 Sep 2025 09:21:51 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 5/6] RISC-V: KVM: Implement ONE_REG interface for SBI
 FWFT state
Message-ID: <20250905-005c0bc3e16e909c5d91eef4@orel>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
 <20250823155947.1354229-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250823155947.1354229-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_072154_003504_73B0C0AC 
X-CRM114-Status: GOOD (  10.02  )
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

On Sat, Aug 23, 2025 at 09:29:46PM +0530, Anup Patel wrote:
> The KVM user-space needs a way to save/restore the state of
> SBI FWFT features so implement SBI extension ONE_REG callbacks.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |   1 +
>  arch/riscv/include/uapi/asm/kvm.h          |  15 ++
>  arch/riscv/kvm/vcpu_sbi_fwft.c             | 197 +++++++++++++++++++--
>  3 files changed, 200 insertions(+), 13 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
