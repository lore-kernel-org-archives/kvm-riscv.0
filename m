Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96871C5516F
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 20:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KFVS+2mobyBnTX+bSOK68IfOd7CRBweFAK0DBS+Dcnw=; b=aoScSiYy3nUmkoLWpiVM6mEBCu
	e3pS1jxBVSGhgGXMq+Dk1uNWEWSHqKEyEF+m+NFRO+q45D99ZsbO9Q/sVWxbr6RlUX7X8WNiMVRJj
	+4KhewRQvftTETiiiSwk4F2LORJD3H7zhG9V9gYfZ5pcl6FFTWOB8uoFejfM5L+0rjS1fAaVWVyKG
	P2wkqA5wRmkWQzh1uvq1lBBZo6e8JeMgvuIFt+y4kXE06IHFpaRgEV4jy8XVU5lJYdj8IxqU6B7DN
	8oWN+N0S/8IhzuAWDUFIpGRbn+nlzl4TTlzDKU21bQeQN0EzPSBxJFsQoqAvuHHxH+pa5oxfdwL6e
	DQHl2xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptZx-0000000DWkE-2oUM;
	Fri, 31 Jul 2026 20:11:37 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptZu-0000000DWjP-3BJS
	for kvm-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 20:11:36 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38827cee19eso1858897a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 31 Jul 2026 13:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785528693; x=1786133493; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mohi3fwyxgZMgHq0qHNtqMEnkOy5lhGMQOSIxwStBVQ=;
        b=icqIVktp+QBGKzh/uLgruoV2gNgY5wk5McVs8aOf0HblMzwDdtzork6by8AcmXhYzP
         OR7r7Uw2IbCx36ZOxmkGg8MJwy4Y7krvtWYxai1I/u7zfXwgSUQQOv53lY/VeYKQoLP8
         byPrwvm19oVhETHTVKGPNKDU5g8j281XY+0HtvRGkIsrmG2vp3c/iVJRHH2CXkMe0v8J
         vUNftm1e+Sk4bnQqpqXbBeSzUWrVKRo4eUWx5ZziYnS9rdiFU4vuuwcjBmcAU84Ahm73
         2RrijyBSSACAo4IkZPlfeQ1ONnaV7QVaC+M1JVTP4HcJBpiRlj73WuudBxSp9290/Ey3
         K/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785528693; x=1786133493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mohi3fwyxgZMgHq0qHNtqMEnkOy5lhGMQOSIxwStBVQ=;
        b=bDjHaXpcjH0vHcEpE9st/llndZgeIniTxQWx7scDOJ2Uh+ucQ5TX7GOSeF7R5qAGM8
         AN/+MKaD4pnwA4lI4XqFk+cokAVwlh9PhX/9jXInKfVuSb9NIbQSx8pl4wvMrTgPCNJ+
         +29hPiRZPmQYo+uoXyLKWGMGMmfmXvpEMyXOlsK0I8pHUxdk3XXcBXMxq4nuzlhcfaS7
         bL2WTB0jH604MKt43OzBtHi1rl0EjsoxMu/wFJb9996jd6gSHP5tKdGBOI/y8X97tzda
         Femhy/tCcz3rEuaBjCYWmi1p080vlyo+yS6wV7OwFRhw2C80x/R3YBOH3h3/n0ORfoqy
         cK/A==
X-Forwarded-Encrypted: i=1; AHgh+Rrb1tqQ2qwT/LWdS2jMO3YlA32HKNpX+HdBx71k8nJHSKW/v8+EmhnsI7o1Fwr/uThg+mCHPlA3sqs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOcrKj6etpVy5AOKv9kymo8Y1dtaJbS/yQsnQcse4BaGnP5tPb
	Hyj4VeuzLFmyyyYCn18UcSthUShnoZ7UWuSDmnlSQ8Q3y3BsoVrKaWJ7LCHaw82XAtKj5DhvZQD
	QuU1k0A==
X-Received: from pjbgz8.prod.google.com ([2002:a17:90b:ec8:b0:380:60d8:dafc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d445:b0:38e:5717:9cc8
 with SMTP id 98e67ed59e1d1-38fbc56c639mr915252a91.31.1785528692799; Fri, 31
 Jul 2026 13:11:32 -0700 (PDT)
Date: Fri, 31 Jul 2026 13:10:07 -0700
In-Reply-To: <20260717162838.1562808-1-shivanksharma2376543@gmail.com>
Mime-Version: 1.0
References: <20260717162838.1562808-1-shivanksharma2376543@gmail.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <178552833004.2710599.12265437445033912305.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: Fix typos in x86 and riscv tests
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, anup@brainfault.org, 
	Shivank Sharma <shivanksharma2376543@gmail.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_131134_799776_89FFF65C 
X-CRM114-Status: UNSURE (   5.14  )
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

On Fri, 17 Jul 2026 21:58:38 +0530, Shivank Sharma wrote:
> Fix spelling typos found by an automated checker in the KVM
> selftests for x86 and RISC-V.

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix typos in x86 and riscv tests
      https://github.com/kvm-x86/linux/commit/653857a5af46

--
https://github.com/kvm-x86/linux/tree/next

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
