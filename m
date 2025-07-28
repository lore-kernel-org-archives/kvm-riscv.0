Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD32BC83F26
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCzlZaVz/VIhzghTIsbOmN9J8moER7JDf122o6a4u18=; b=BGFSYd5v5KOuWC
	ZywLFEqo9fgrkkah2kbpUe/hBBYudiaxypkgyCbc6NyDU4p2x/q58hBjFLWj7k02hxd0xePXhml1i
	JIknCTjeMpbT7S8OytFfSLf2zeoQhDtN6wyJQGSBN+1ryF3PCjKPRXLyLcM/9nCTUb9nYgZMX9XB5
	b8zGTpu2kjuS2lu+5/Rp+FvHUy8spSWlgP16MAma/ULWKRrc5XjFONW1jbOBCzng1pmObwU/yJICQ
	wSw4YuXvaHDM2O/Id67IRYzqLDIZ3n62tDomCz1XnjrgpvMbLkvsWqUrmIjaDTht2rp+94jJEf70F
	7VhIWNSgsPWlfxMhzVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRaW-0000000F62U-1n0U;
	Mon, 28 Jul 2025 17:24:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugR3Z-0000000F21A-1RU4
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 16:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753721432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=krd6Kt/L5G0L6bxrRwfmRWwoqSRe3HGaFQKVpx631I4=;
	b=SaO+ApVARCHdkVo1V9SjS2lQGS9MjlvzfLk1wQEWUale+nMYf9EDo4ND7UyUu6bgeNxDbt
	XUDyip2L/m/okn0OueocnHCJ+4po6nGPJPJEh4P5fP5hFUF95GYJkEBPMHhojgc0c/B/TK
	gBNElNz4K05EtAm0CCgJ1lwrxH7KUCc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-Fwinv86pNnSac7qn6TS0Gw-1; Mon, 28 Jul 2025 12:50:24 -0400
X-MC-Unique: Fwinv86pNnSac7qn6TS0Gw-1
X-Mimecast-MFC-AGG-ID: Fwinv86pNnSac7qn6TS0Gw_1753721423
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b783265641so1663829f8f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Jul 2025 09:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753721423; x=1754326223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krd6Kt/L5G0L6bxrRwfmRWwoqSRe3HGaFQKVpx631I4=;
        b=pWo7yTNIGO5TZ0e3EB5YR3LrsUztNIoaq636JZ803Jz/7XAfFlAV4wBfHMvjPEWM5U
         UKMDX62IDzZNKz75QpLtPMlLF6Ov5IcNTb7KutRldyRAKqC+oLZlCpKWYuhvMPsAy9zO
         ReKtoluXExVEBOGsUAEnWWx3E9V8zIErNIKzX1p12RXxML2PVQtU6MYf1bk/OU9gFhr1
         kBAe63fITwQ8mqXPQ6wo5DNzxG4do2NKleqBLE4DGwxYtfMi5LhMeeNaSCS2JX8YDCL4
         NmhcQSuNluT7b/zc6Ve7XmTgkHpoLs0lgUzsS0wKqIjUbDGhynRQBtI8bQGWsaBWfEPE
         fvXg==
X-Forwarded-Encrypted: i=1; AJvYcCUZnPs+mUj/cbBmSuWBGgoYi5mQzBc3v+rj2oa1eXq3obIu1SboVuD8MJEEcQJ/glVDtOwqWeltfe4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/2RQcpf3cqjl7MiI4J4jRyTPpMQpwV+PeZl+bw0zwsjoovPJ0
	MyZwgNEI6QwLknGJ9hvWzPWBm60hzcCAQDdFBlUyec0WqAS3rhlIbKyvby5VjPjUzHi0+8XC9KR
	jcB3TUD7F5VWpAU1iYYqrTL5AGt/ckHm6eQdYA/HrZ3zW82gw6zICq6Q7HgzCiRzByAzyBxZYRp
	1+wxU0HGJNouo0OvpPz92ZW22vGMTAtFyt8sOGhT2eOQ==
X-Gm-Gg: ASbGncs0O0pGBXuuN4wOxGVygQcqJ/LHA04tyfoS78UI2SODiIozK/ftJzeEUpDfWVy
	ucnlMn6CKnzlfLJAmtWvcFGkhNp6iVQHMxLM72C4whPWBSUsKAGOmWl3wLLTJ2yAmdTmnlEF6q9
	3E2xon77xpt7PGJt1ow+r5Rw==
X-Received: by 2002:a05:6000:2289:b0:3b4:65d4:8e27 with SMTP id ffacd0b85a97d-3b77664284dmr8049080f8f.29.1753721423477;
        Mon, 28 Jul 2025 09:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9AiNoGh1fFHMtVXbzZwnzqr6JNT8EGrYNFrd7vLtXR4YXPbw8TBf9CBFH0MTT1XEnkoJVr47qarAG9eP/TTs=
X-Received: by 2002:a05:6000:2289:b0:3b4:65d4:8e27 with SMTP id
 ffacd0b85a97d-3b77664284dmr8049066f8f.29.1753721423075; Mon, 28 Jul 2025
 09:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
 <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
 <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com> <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com>
In-Reply-To: <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 Jul 2025 18:50:10 +0200
X-Gm-Features: Ac12FXzkdtm88_4dk2KzyvFSOMEmlVWQkf5aJBT83D16EQ1ktTyFz-doPwtE5M4
Message-ID: <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: giiHXGo-gsXy3glGQetJvXJcv-p7qUUGDBzP7xJSlng_1753721423
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_095033_443942_447EDA9C 
X-CRM114-Status: UNSURE (   8.93  )
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

Il lun 28 lug 2025, 18:21 Anup Patel <apatel@ventanamicro.com> ha scritto:
>
> Currently, userspace only has a way to enable/disable the entire
> SBI FWFT extension. We definitely need to extend ONE_REG
> interface to allow userspace save/restore SBI FWFT state. I am
> sure this will happen pretty soon (probably next merge window).
>
> At the moment, I am not sure whether userspace also needs a
> way to enable/disable individual features of SBI FWFT extension.
> What do you think ?

Yes, you do. FWFT extensions are equivalent to CPU extensions. But all
this should have been done before including Clement's work. Without it
userspace has no way to support FWFT.

Drew, I see you have Reviewed-by on the patches; please keep an eye on
this stuff.

Can you respin with the fix to the SoB line and no FWFT support?

Thanks,

Paolo

>
> Regards,
> Anup
>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
