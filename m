Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74A3CD6E55
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBl7S2pEudOXm/kAJ9LU9K0gbIB+Yud5rS+Sgp9sHPM=; b=a02KuCwp8RIr+8
	wYvMfy3QSXRS91eCKe3J0eltg9Jtb4xCtRFEaw+knA2fuaju8O0fsuyNoFKYhtf2kT2uz8TkjLrIC
	t0SOOqHEUM8kTYtv67m998tyS37iWakVzhuobis+7G2hm8pHg8TRwaDolHx8ygZuE9yaDJq4sdQsr
	VhIvCKvrINfecaNgOGpro52oybl0r4f8UkAOBU+tm+66yFTTRkm2epQOEOlvVbMcpAtMgdfAx054J
	0NijY0MYhVBXKromItq2fK04PVatcu/wd9G6Dppaw/48GWGMYRS+BkO8/6zuBMwnrT/BpcJeoNm5C
	hMzQkuFK3FS8ex6niY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoY-0000000EYr6-2eY3;
	Wed, 03 Jun 2026 08:19:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoX-0000000EYpp-0PaY
	for kvm-riscv@bombadil.infradead.org;
	Wed, 03 Jun 2026 08:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7YXXRHTsYqYQHd5MbLWphJfk7peWK7x0kQufaDYO3B0=; b=GDqoIO12LLRkfGKk9qr0+f8Ee6
	y7G3Mo8Wuukq26u8gzV+felYDts61lDzu/anYO/FYftZthh8XT/GIfM5LoS70ipJC85OMKYLPIwlP
	3ZUXrZBGw+mfTKma/BVZwjnmovFdEynITPkOgaukZxI0CYhvuBOzn0DUzgkB6WW53wHncoT+bYCei
	dT/lxP9uomw8xFy29PlTCfSeDt9oP709sVhALp9/OfhBXpk8zmzQ1w6RxuKixpMVTn56GDZRSBZ22
	RhO2BLN0VjIe6FxdLJj2We8lkdo+IWw6ZywU3pi4T4pju7JUT18iIqUTE0FStokoQX5YWLrrl0bnp
	W4y+nD7w==;
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUgoT-0000000BYWb-2q3i
	for kvm-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:19:00 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-69e4483cfe9so169738eaf.0
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Jun 2026 01:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780474736; cv=none;
        d=google.com; s=arc-20240605;
        b=ipCjsUXSiLcYImEX6G2FfVKAn/Yhqg3zoLsFeHBJ8HLKzCbSrrfnjoX5v632YBOAcQ
         nzongF5dRRkaa0HyRxOydUUp2VvyPp9eUUeEFmnOnZaVV1kIY7Rb3yi2ML02oSMTFuAL
         QZEVDU8Jkm4rtEn1VWoEBaj9ImMa3XvO9qtEmYvmzHw12scV2Hlh0/gC83KB+Ss1pGWe
         UvvMmDd8AMYNnqRiAVveeH9xhYcmuMDOZY5jBIVm9M1g4yUemsP6P8pXT9JLPhM1xy/j
         9DTUQiWuTEpRrDnZ+9bIDfyxFzbdlIJVzA52aKWJKrhpc3966LJnZcm3yoowYQTN7sqH
         QnHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7YXXRHTsYqYQHd5MbLWphJfk7peWK7x0kQufaDYO3B0=;
        fh=Ob4ieSc5qG3xIYi3aQ+8UZq7TmuOLAIq1flINDjv7Rc=;
        b=Tw0V/OwD2sTSgycOgx2lyQ/HeZTUCepHn+kFLiH0wCRmXHeYovIH/IdxaKfTImB70I
         UnibzJs+dQ4uc1YrFjjHJ8myDkJRFs8IQ2i/Dkne6+HFdrkxXv3X6DTsD8rkl1T3e25E
         v1ipuGAegQpL/FoyOkEJZ9nwEvVLd9diQfyN9pa8CKAmQCu9sZxGhbvsaWonRVI+GFVq
         JsK/3Va/2IhS9dOitaS/b4D6zPk5JtGQ4+T6SrnxWwXXdoxAHxEbV1w/szWT13Qj+v42
         dZolH17FmtEjwljyxJG+sZxIQpFphH0cz6jtBAw7eFjwmfqw7VKgBIOkWivMRcsoVMh0
         PaMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780474736; x=1781079536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YXXRHTsYqYQHd5MbLWphJfk7peWK7x0kQufaDYO3B0=;
        b=ZwxmbQ4Erl3G2kYmnng34ACycuOCLJkByWZGZZ0lqAJnczZNGfNjs0sU4+rVHRoKKC
         d81LfaNbBt6apDJjCLcT0V2bQUrWkb3hNUCwdXo7IKhCEobdYkXK6Y4/qlBKlHn+XIdW
         yMxBHCkIOStY6x3NCSTsPqv+duNjtX3zHjzSrXOAkXmvKpjXqANaDfX/fQ4Ouk1LuBQm
         fCYq68At+gTmF40MTMLvaFa6DyUoj+ZuWRGs4q7Mk/jc80Nfs00/IcSmos9Pi2hQsJgI
         wG9zIO3WKM3DyCnipe61yTGXj1pnjFVzLBzQ/K9meDP3w9O+1VvWOfCvU3bhg0/9nGbs
         J8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474736; x=1781079536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7YXXRHTsYqYQHd5MbLWphJfk7peWK7x0kQufaDYO3B0=;
        b=OrtgSzMDPBnb5aNd1m0gX9AU6WMpjEHZkHryT7E370aAqBSSV8RMPQEf+7kkS1nXM+
         4tmvV8rmHVLMx/kO/IbQ0ZrV6/7ZslUoImo2mF8qE8SUf9wiydgQcs9CNswSqAOwKrL/
         2BNL9ZI7ek6A9VqAFyZGMrEL+GVvBMm7zo3oCxvMpqE+A3sm+Rfc/r0hM1UKmIPbXluB
         0bYLXHOMcpBKO2gBAMwfdvggHYQmxK/6IAiQt1KJE3a0jlSytRMkr7jy5x6po8P0L/xM
         lKrNoixKoT3rxmCjjd5XJWnpId4JLRukh4myLh5PTzi6EZcqEo0c6qp3vdP4as/icnaC
         2Nig==
X-Forwarded-Encrypted: i=1; AFNElJ9PUXQ8VP7dBXyW+/RxIB15FHVsals5wXmu1fKR+uoM5c/BMZyOn5DSO8tuc1DJSppCzThWEaxUh7Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8c6j3Yb/fFNutyf2QPyg71vX4u9DMQV/CNJ5lzW2/54b9UvkD
	/pjElmj4l18HO5leEZP5H2XJBv0DqDeggxMCJdfQ+dvIf/d8QHjzdrGuVOxhQZbaFcTF5/Vr68I
	f3XvPR7UAdu8/QNWqmj1C1RIkI4mp0V+SbkOW12gAJQ==
X-Gm-Gg: Acq92OGNFPPWFZy6SEvJhS5Yb8MflfI7CG5CkyXkSCd52yAUKvh+s82inBvUtdaB+t5
	no8n5jIxtKjmAsarwaEDruJVaBT//qdJa42gz5BEV6EF487zGLiMW7WctOSw+Szry/G/+0UlV5L
	QzM97eOhfpePpA5dm14oa+LAHGATQcq0YE6KIHGAvE/7W1qm6EITa5HKwJNMf0X9mo3nEXk8HUL
	Q0AfdbzxjJN8g41PuCNYkqHbypNmOsNnSSj6SkNpaUXHOMzsKR62Dq8Fq/eQFnPoBNTt9uAlI68
	O4ES2XevFhrxnnZGGzIimPs0FetXJp1qOxkwJcD8TlY0DHkQKy7EF1B2BaVpXpv+lIAmPn+/Qjg
	7NbxtOaF0soaNI+gegI9NmWaMIikl8v73WGI4XXxqj4vC0D3t
X-Received: by 2002:a05:6820:4c89:b0:696:6e28:8c19 with SMTP id
 006d021491bc7-69e48c8b9ebmr865206eaf.20.1780474735890; Wed, 03 Jun 2026
 01:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn> <20260513154251861FBOlxl8ySih_oqyoJL1iA@zte.com.cn>
In-Reply-To: <20260513154251861FBOlxl8ySih_oqyoJL1iA@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:48:44 +0530
X-Gm-Features: AVHnY4KAwfGnPP2mIswxICBynzTnVouAFw9Yon74XWLX5xuvqnAhH_lb6zEINMc
Message-ID: <CAAhSdy3vB+jes4WxQh4jN2GSmLYU6i_tySfKd3Y2xcZJQ6K0Yw@mail.gmail.com>
Subject: Re: [PATCH 3/4] RISC-V: KVM: Split huge pages during KVM_CLEAR_DIRTY_LOG
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091858_436415_F3ACA19E 
X-CRM114-Status: GOOD (  13.09  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMToxM+KAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gU3BsaXQgaHVnZSBwYWdlcyBvbiB0aGUgcmFuZ2Ugc3BlY2lmaWVkIHVzaW5nIEtW
TV9DTEVBUl9ESVJUWV9MT0cuCj4gQW5kIGRvIG5vdCBzcGxpdCB3aGVuIGVuYWJsaW5nIGRpcnR5
IGxvZ2dpbmcgaWYKPiBLVk1fRElSVFlfTE9HX0lOSVRJQUxMWV9TRVQgaXMgc2V0Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+CgpMR1RN
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3Ms
CkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDMgKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9t
bXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMTRjNTU4ZWU1ZjE1Li4yY2RlYTNl
M2VkNGIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS9tbXUuYwo+IEBAIC0xNDcsNiArMTQ3LDkgQEAgdm9pZCBrdm1fYXJjaF9tbXVfZW5h
YmxlX2xvZ19kaXJ0eV9wdF9tYXNrZWQoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAga3ZtX3Jp
c2N2X2dzdGFnZV9pbml0KCZnc3RhZ2UsIGt2bSk7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl9nc3Rh
Z2Vfd3BfcmFuZ2UoJmdzdGFnZSwgc3RhcnQsIGVuZCk7Cj4gKwo+ICsgICAgICAgaWYgKGt2bV9k
aXJ0eV9sb2dfbWFudWFsX3Byb3RlY3RfYW5kX2luaXRfc2V0KGt2bSkpCj4gKyAgICAgICAgICAg
ICAgIGt2bV9yaXNjdl9zcGxpdF9odWdlX3BhZ2VzKCZnc3RhZ2UsIHN0YXJ0LCBlbmQsIHRydWUp
Owo+ICB9Cj4KPiAgdm9pZCBrdm1fYXJjaF9zeW5jX2RpcnR5X2xvZyhzdHJ1Y3Qga3ZtICprdm0s
IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QpCj4gLS0KPiAyLjI3LjAKCi0tIAprdm0t
cmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
