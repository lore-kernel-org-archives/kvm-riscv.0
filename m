Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA43FC02181
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngH9ohWL/QGcYv6SbCgLyuBc23KRysI8UmJrv3WQ7rA=; b=mTncanZAHiCywT
	APtj7Rav9yh6EJ09KxTXbPVNDEXiv1RhPAu6iJ42l/2aWFAkvZOP1gZwqSm+WhhMxaXE436xAZdaK
	AUvfXe99n3kLVJaMJl9JVWRcsKdjXEQJjJrtlOINFSZRZdzUJvwe7Aop56sl+vYvFS4m9GRvURc/F
	28I4YjrFdNH9s0+IXcZlgfGdnBRcPPsQfTinw2hhNyKjhWmZp4aQFM6lbS5dby0PFmUmGqAq3imK2
	MgtbgHn263IpVTa+F/ppdD2Ei34HbOokk7rDIDZBDFVvwrKlNBINk1cgnnHebIfhNfwGWQ1YDAg/a
	Ngqyh2WT+rWOesoYA3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqUX-00000005V6i-2Gu4;
	Mon, 20 Jan 2025 12:02:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqTZ-00000005UtD-1u4i
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 12:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737374511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SYKfxNFYxhC5tp+ktcnepFGyB0OkMabGlnwkvsEEmFw=;
	b=K2PEmxiCdeGns8wIPrO3DTuy2taCT5/Lrnd4jITsK53B1DyVnOG6HTFi+T6u9mGYugTSrw
	uQB8vI0/DpvkACPGldiEykdTfa2YbqPzrZ0lHo6Z/RQskpt5QTFDkQgCOtnDJBCuVebZS1
	V+ATiVbpaNsPxydgrBsi6pOnonZt4aU=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-SqEwWeDAOIqVugAzMbnRdg-1; Mon, 20 Jan 2025 07:01:50 -0500
X-MC-Unique: SqEwWeDAOIqVugAzMbnRdg-1
X-Mimecast-MFC-AGG-ID: SqEwWeDAOIqVugAzMbnRdg
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so12493393a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Jan 2025 04:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737374509; x=1737979309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYKfxNFYxhC5tp+ktcnepFGyB0OkMabGlnwkvsEEmFw=;
        b=mwGNSeCRbNrEKhh3Kv6349+z09G/OJCypYDzbBAUdnmQjmOLjCWP3yt0w72XUTVGMR
         q1kaDJTtFQ651PHPm1CNRLraYY5Zom4Nl2YdDRslP4I/qVKMJK9JuCMSmTjSeFfiWvvd
         UUnT2o9y2MTqXO5KUEJOUYQ9gGpAMr1EhUc0ljczhtcsBa4llfIBzQ6ulfuiHppsSdst
         ieeaq7r/CGyRcYDyM2PLvsKbO2helQdvKR5Lxfwp8wmdV9fCjLK/cMsz+9cDa7VQFdQx
         mDVYjX/o6RuZybqyv8L74lqf1VIzhrtr5tmH+YldGqipCXbf8+6JUsdtsNz6zm2rHH9h
         BgBA==
X-Forwarded-Encrypted: i=1; AJvYcCUnAfQIj4iyy3F9tUX1JWMgzcQeBAuRPc1B1E6vBEAJ1AnWhE39G1qWBfuJ6c7DHk9I1aEsTZp2+k8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz30gE531NABjNlfyzGUWv/h07q0j3CryTdCJPRgSSRLPtOGjB8
	TG5kI+aogAbjOENxUzyTNgTSGMfBeZdpclyxzwVJRhzptRAa1L1AfzuEELjMeF6kFPQaNB32p4W
	XgQUhM1zvBebr9A/Qvrgae1rlW/05gSQxrdiK87ljQrCUxd2EL9HLqwBCJOt8KkYzUI+IzfYDxN
	Q4CqxR6yCbLsGugCrYqvYXhp+/5ULbA3JW4/KTCA==
X-Gm-Gg: ASbGnctJB9yaDKOLKWv3OoyzXg0HJGBgn5lutDLFmADb5alYvNACBGY5SfLZNiMxvVc
	kHBGdOh+jxehCYbAVfDkNkYypbIPbmJe7cMnENu04gysRMublNuDZ
X-Received: by 2002:a17:90b:2cc3:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2f782c628ddmr20773374a91.7.1737374509054;
        Mon, 20 Jan 2025 04:01:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1LRLBhFZRWB2znAXBn4FAGacB6x+A2zIQjytthY1v4NzuLkQgTJ16dSmn9MOSylm4ule4XauLDBusH8m7pTM=
X-Received: by 2002:a17:90b:2cc3:b0:2ee:d193:f3d5 with SMTP id
 98e67ed59e1d1-2f782c628ddmr20773345a91.7.1737374508813; Mon, 20 Jan 2025
 04:01:48 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy1ekLq08nByCh9E-ZZsMcm7rCpkA+FyAPwvQctEgjwFZA@mail.gmail.com>
In-Reply-To: <CAAhSdy1ekLq08nByCh9E-ZZsMcm7rCpkA+FyAPwvQctEgjwFZA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 20 Jan 2025 13:01:35 +0100
X-Gm-Features: AbW1kvbcdodU2ZG1R0TokIdouSIf64beyJoIpVpvZuIpYKLq0Y8X83srGMtTqWM
Message-ID: <CABgObfZr6txxPVKB=tDvhFbFORCbP4rHmuQJUjVJ6hi2c9kMsQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.14
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H_PjrCjle_tbHnZA29zzrgvhDwJbL6TTNj128G92eOk_1737374509
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_040153_560542_91E4A05C 
X-CRM114-Status: UNSURE (   6.52  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gMTcsIDIwMjUgYXQgODowNuKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
S1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2LjE0Ogo+IDEpIFN2dnB0YywgWmFiaGEsIGFuZCBaaWNj
cnNlIGV4dGVuc2lvbiBzdXBwb3J0Cj4gMikgVmlydHVhbGl6ZSBTQkkgc3lzdGVtIHN1c3BlbmQg
ZXh0ZW5zaW9uCj4gMykgVHJhcCByZWxhdGVkIGV4aXQgc3RhdGlzdGljcyBhcyBTQkkgUE1VIGZp
cm13YXJlIGNvdW50ZXJzCgpQdWxsZWQsIHRoYW5rcy4KClBhb2xvCgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
