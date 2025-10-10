Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77773CAC5BB
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3+xgstGl0wUx1Osz6nF/2EwfxA90RYyCUcMhW6bdOdg=; b=Rv3d8XgX8tG1eLLwtRICHNN6Dd
	xVZNNJ2V413so8VjybQlBLg37anZVGyshwSesFACHdzDHDo1IBojlkb33RZmaoWVAQAgByvuxSi/y
	/LGonSMvm5oVBaC1ZL8nV07A4Qasn9UmLattGXGqoG5BRKUHJT+WKjZkbp5nuSiy6+dAgcDoBJvcT
	X6UFBDzrrz4j26j7/VldmQ/M2SLRNGNf+dpcyLQ/yEsbi65CwOwqE0MDxAThrcnqBmfqG+goGasUA
	6UU2Xp75A7uOeo1um1lhcO2ty/3TQiynLjkwlW5jF0nOCcoHTl3DaUNKZYZDFx+1740C+krPz6jAm
	ZSKCAuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v79iQ-00000008CEk-0lPT;
	Fri, 10 Oct 2025 09:47:10 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v79iN-00000008CE9-2xFt
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 09:47:08 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b3c72638b5dso327110666b.3
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Oct 2025 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760089625; x=1760694425; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vqq4E+QcPm5gIESa9RU+pQ2jp4yfb8xgjlkjRCHokwM=;
        b=tQFQLBi1WYzAO66ijtiaisoGnc3MJwxlojpczl4MRnDVS3EUPBZi5v4snacLLPG7tn
         Q1SaTlpSvGoMLK6MvgxJhRWx3rXybUwE0WOl0x/QecaSKSSZVTOZwM+tAcdA1ZzTpoH8
         t4YlmP3TaqGOA0vblj6lb/rEJYS3yoOblJavc5Xb1Gt1vw/I/M/Qgy9d+1i4utyRUbLa
         eT73x7rguimJKU0eG8gn052ixjyvhc4N76IkOrhZqDgvfB3i2O6lhV/gmmn4zRQLsrYz
         hIpINONx3aRpuxEiJL/m6f7Sz9z1+hS3/ofw9vDIZj6jQhyHlgB+10DjLiOf3pdb/rY8
         Wp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760089625; x=1760694425;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vqq4E+QcPm5gIESa9RU+pQ2jp4yfb8xgjlkjRCHokwM=;
        b=Er5l8VWt7Py/jnt2wdy4BjiNWgREPiP5UU6vX9x5nJzZv9BIb2ozPiqBQZhp/mgS1v
         TksI8tx8VWDgp3HqS3ARoNug+EOk7RFTPwJRlUsGqifFj47dyufzcX1dQgIWIHbIg7Fv
         f+BKVwSlDHy8qNjuqV21Ht+V3pMnKjAIs9/sceJp/wFiy8w1Dkytzn4y0ATSzZHZlCZr
         UNrHKsZfEbt/lWREY7QbZeOz9BRU8O0t1jmoRlk2DnglV07Dukmij3P/WDIFb0O3LCzZ
         IJF+YpMHyHXdAnZ53UIQtnwnUwcLTRDM0r/1pnZGKBdj8JC9f+UvedcUESaAAS1Ls90l
         e+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQqmHnlaV4Z7hJu7jMQt7/dy0NRNFkkaUoda4Z2S9vXFchPST867Xk/+1Pr4M4JKfAI+SPcxkOHpI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxRIHioQ5zWV/TpQWZJu/JBFdIQAIN8UtpSboPpkvYC1aUR4GO
	if6mmQBWLl4/Zle3ZZOeoHPAxdL1bS/NfiqBT8Dm6xTJE4Df/FTS/L4YvHx1cIvLFRxGI/3r5re
	IPjCoq8X/ahu+0Q==
X-Google-Smtp-Source: AGHT+IF3kyGZ45/SIomeQ10Oy0HpD4ltmqNTCbJ2I7tWbnIvSDEZQxkMPFlCPp/SVExbwW1i/qxQKgZbK/NQ5w==
X-Received: from ejab15.prod.google.com ([2002:a17:906:38f:b0:b3b:af15:535b])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6e92:b0:b3b:82ee:def9 with SMTP id a640c23a62f3a-b50ac4c5bccmr1154491966b.53.1760089625454;
 Fri, 10 Oct 2025 02:47:05 -0700 (PDT)
Date: Fri, 10 Oct 2025 09:47:04 +0000
In-Reply-To: <20250930163635.4035866-2-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com> <20250930163635.4035866-2-vipinsh@google.com>
X-Mailer: aerc 0.21.0
Message-ID: <DDEJP752Q32A.1YMQI5QN4IP0A@google.com>
Subject: Re: [PATCH v3 1/9] KVM: selftest: Create KVM selftest runner
From: Brendan Jackman <jackmanb@google.com>
To: Vipin Sharma <vipinsh@google.com>, <kvm@vger.kernel.org>, <kvmarm@lists.linux.dev>, 
	<kvm-riscv@lists.infradead.org>
Cc: <seanjc@google.com>, <pbonzini@redhat.com>, <borntraeger@linux.ibm.com>, 
	<frankja@linux.ibm.com>, <imbrenda@linux.ibm.com>, <anup@brainfault.org>, 
	<atish.patra@linux.dev>, <zhaotianrui@loongson.cn>, <maobibo@loongson.cn>, 
	<chenhuacai@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>, 
	<ajones@ventanamicro.com>, 
	kvm-riscv <kvm-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_024707_739650_078C2411 
X-CRM114-Status: UNSURE (   5.98  )
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

On Tue Sep 30, 2025 at 4:36 PM UTC, Vipin Sharma wrote:
> +    def run(self):
> +        if not self.exists:
> +            self.stderr = "File doesn't exists."
> +            return

Nit - typo here  s/exists/exist/

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
