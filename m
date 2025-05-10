Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3901CC3ABC3
	for <kvm-riscv@archiver.kernel.org>; Sat, 10 May 2025 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7Qc87VmtRi8hkDEc/xhHzZvuv0po/3rFgKcBtftStg=; b=Ovl+Ij7yCdQdHa
	Uy6fB7Qg63nteovJiUcLHl7uG0t0rlqvFZrUX0adu8YuG3ez2/43jdNK/iMELgNWKiUzTs8rliEuq
	m9phvUln0xV1GBZvLs5mrkZNLHLTk/xDrFEWdOUUckZkynbTQRfgg5lGBcixkJ5lorD2q28CXr13u
	5HufO0YEo1adjQi+iRqac9qm2W3jh8P+YgTu9abl4BoCrmS3OZ5hV88atpD3FvZqQyv7ZnK+Wrlgu
	jd+s8wY3wqvw9R3e+UXPehtICOPBvh0BK/De+hL0Cz9nz0EZKddcqzdlHY7RoLZTiaF2mTdvJf9VU
	oBfFurXUmKMQKv0c9BZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlq6-000000063tK-3M3D;
	Sat, 10 May 2025 15:10:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlq4-000000063sp-0dMm
	for kvm-riscv@lists.infradead.org;
	Sat, 10 May 2025 15:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746889805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSp0XQpzSTcNL5A8tzPVsKcCl0AKeTrOu/sN2l5jc/g=;
	b=hUGFeQvWzsMtw/PluX697JlnxJzgm59FgQsnZ0wO+vYVkgR2XIJ0ocOlO98vWlmtqaoOEx
	Z3jWN7CXRTI0zUG4MdE2g6OwcuYrYKDpjtvPXRGolWMRg79NePHhVUoYuQaoAZQLcHvgY7
	GeMW8xJoReQQBhQ1u4Wf9iKw0Qtmv+s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-Yo9iR2JvNkWFoWHLik0daQ-1; Sat, 10 May 2025 11:10:03 -0400
X-MC-Unique: Yo9iR2JvNkWFoWHLik0daQ-1
X-Mimecast-MFC-AGG-ID: Yo9iR2JvNkWFoWHLik0daQ_1746889802
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a1fdf65ddfso337188f8f.1
        for <kvm-riscv@lists.infradead.org>; Sat, 10 May 2025 08:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889802; x=1747494602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSp0XQpzSTcNL5A8tzPVsKcCl0AKeTrOu/sN2l5jc/g=;
        b=dTUgNMvvq3E+MhAHlqXL0yiDqDj8RZoVFwP/GqcyNsbFiFzffr/qn6m+EMF0x0x1m7
         Ig5idONY9iZe1EbLvQDJzGN7NLOA4eHC5J6V0GGfr6KM3AE3hPMwtZ1rXHmXO2nKDGag
         InxySg2tL1i7AKo6HnlGosW+8XjCT/D+azwvBAN2ti8ulRfD1gRce0Z6B9ZAlY+oOpp0
         7QgCk7DPamcFhbtdxFdMDOBt4HjPmslK+5Fu6DxmFHGwv3x+o2nF5rxMiyjOnbdOPVnc
         wE0BCFDzZNeT8Z4Wp9gU+qQjYn9QwtSoW+OYZY8zaxdB1miDBu8F11WTUyQx0qeN/lrg
         7OXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkyy6N5gnft1EM8hno8HJPAwFBXT4JOovEqaErusijc6O8jHW75uG1UjH/IcHVYnkZm9aAy82ixFI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+RGvI3IuVlHVxM5W2i9GFMGQVTS9m6+d58ewL4vve6q3jjVAr
	zhNOnvtsuICFo+7RdtdDxtCjdkuJULGFMBlG9ooCUfyY0TpPmaGE/F4N1oIwphXmHwwSOJtd/8V
	rnTVziVfe8z3xf3S06b+VF+Nf/tJrFuLy/DLs6OojSez/infsYNl77dTi93dWJlie7kKQz0paxw
	SngtDsdV4GCI6zIHRV4Iz0H2X4dyO5lwAU39uSkA==
X-Gm-Gg: ASbGncu6vZwXg/vFTWtRB+boqPs8eEzplhGjKffqJ+YAlzSHXLZhFNcSL0FQN7MCiGn
	EIl9rT9DZSydEYrAS5Ea3vHfzgs33y81Bro4GUroxbWxl1Lk2ldm4i79QBhMfdKKNzJwM
X-Received: by 2002:adf:f44c:0:b0:3a1:f701:ea15 with SMTP id ffacd0b85a97d-3a1f701ea9bmr5340950f8f.55.1746889802390;
        Sat, 10 May 2025 08:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTrsQVFY/Fgr8ISgzK47J1kK+Yrt701ZSvnSrnrcZmClYr8VRCd08zVc7FFV0ODaXSCdq0pbsc9V1BsmPfAkY=
X-Received: by 2002:adf:f44c:0:b0:3a1:f701:ea15 with SMTP id
 ffacd0b85a97d-3a1f701ea9bmr5340935f8f.55.1746889801993; Sat, 10 May 2025
 08:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy09tkokvdvACCQACLdvppTTQHDOR+O4jtkhVP4PaW_k7w@mail.gmail.com>
In-Reply-To: <CAAhSdy09tkokvdvACCQACLdvppTTQHDOR+O4jtkhVP4PaW_k7w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 10 May 2025 17:09:50 +0200
X-Gm-Features: AX0GCFtixaY2aut0ABjtOGBW3kol_5pEkPm5-SgtfoURVxZJrIE5ml20E7vbZQM
Message-ID: <CABgObfY+2CpcBNc8ugsrvOKr9dR_P=KBuysgVN_cx3_ekQSR2Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.15 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EnfAvTSlRBYbMonT5vg9RWKMtQC72enQ1_utVpp6jb0_1746889802
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081008_314155_9F1855D8 
X-CRM114-Status: UNSURE (   6.97  )
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

T24gRnJpLCBNYXkgMiwgMjAyNSBhdCA4OjUz4oCvQU0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4gd3JvdGU6Cj4KPiBIaSBQYW9sbywKPgo+IFdlIGhhdmUgb25lIGZpeCBmb3IgdGhl
IDYuMTUga2VybmVsIHdoaWNoIGFkZHMgbWlzc2luZwo+IHJlc2V0IG9mIHNtc3RhdGVlbiBDU1Jz
Lgo+Cj4gUGxlYXNlIHB1bGwuCgpEb25lLCB0aGFua3MuCgpQYW9sbwoKCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
