Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E888C54FCD
	for <kvm-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDe21O0AFi36stVF6tu9IlWD6Ddb0Y1zGYB8bjQO0Og=; b=2MraBsi8BWgCN9
	Q8YGWSuEHvO2pxMRMyhZqMtdurXSjYA1MfAhpj0QrL0Yl4wa2SKTlwA+erXClD4k16NfgTmSCMuiQ
	TQOH/TKY52tGBxNQMMdy3yEhqkZlA/QPGM83IMKwtb+LDpovV+IvMrClw78vhkGwHmaiddpPp1/OB
	xjZB21LI9NEJyISzUNEL/c+bD/eIBYzNmhoVR3iQL1zXxIFHaLL0q7MSoRs6iGHEmAsF2N88CVbcd
	tT60RcphrM/eYhyTeW+RyXOtf+F1WLKZgg6fEdX1MScDZewO7u69V1NmPsqdspTyKyhfJ8rfzamia
	yJlLPzpl56lCMLAvblgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Y7-0000000E6C7-02r8;
	Sat, 01 Aug 2026 08:58:31 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Y4-0000000E6Ax-0LPT
	for kvm-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 08:58:30 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5aec6360133so1589595e87.1
        for <kvm-riscv@lists.infradead.org>; Sat, 01 Aug 2026 01:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785574706; cv=none;
        d=google.com; s=arc-20260327;
        b=cMRB9ZFuTLKcTjShwnkl7qFyxjJgXBCPbxcFLH0684VejkUDg2rR1/ELyFBjBW9Fbk
         DkzClGfZsx2Z3i/opRtQ3D3UsDwJn2m5IEnZZjr569lqJ7KbYnUU8VAjF1Svmr4rJRBH
         2ov2CrgMe4YCFkwwyUeEE7eCeWeCHJ8GKzADzPw03fUeHguKycENKpMwftEiONf1H9Kw
         ct/P+K0U3sLFu5i7NSsPTtDvRZLa3zvaL1F1HfK7DHElVZJJ9AcPbQCM0JU/eWcMcn6j
         lrNT3t+nXUKmc2rb2hw0Kz92hNr/Z7eXSSsNwgBXPCEZ5yA+kaqMb+1cD7EdMI8SfqTW
         mtzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ot7Bn3ZEURQrk42Oh0sapiZcIWCpwwKzFXd66di2HQw=;
        fh=qpP8qXYtqzkL6ii9zhGG33pT/qLVk05eerARKmgT9dE=;
        b=lnhRKPTKxo/Rss3ysvhO2r40k1gxvK5MWE19RUpFvdBNc1mVMymOX7wNUTQXPb6S7R
         lURZ/NU+PzSxh7f0t7P0gDwCYWNTWu6uE7Ma4yDnnk3UqjlKTeWYw3PUxxqqegXfPh+L
         0fuIpFedfxxfks/5W2sHxCx17LiCSaRxXhb/EiZZbNl5k7z6rxdBuqI3PoAYjs29HTFv
         ZYkS+5EpMRjk/iIt7q2DD3fNWRl+uExbPDRVcgiouI4svdLEYORdd/JBZyuHzIEzOsIK
         uhKy8FBGuiGBMkmuap83SWyL6Zy+sc4NWj79ghS3UxisbtHeogEumIl2YIu7Uhiswt8R
         B9hw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785574706; x=1786179506; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ot7Bn3ZEURQrk42Oh0sapiZcIWCpwwKzFXd66di2HQw=;
        b=JUdF/WfbZPWbP6NcRnkHcpMdtnOXh0TLCk4Hi1lZhHoTSF263fjpxdj9fCmVfmif8t
         g00JUBazpxJGslUmN0MJJ3DREB+jOdyYGTNUm87mKmNsio0E3Hc5/FJO07d12gbmJnIT
         IUpeUucMyCZvSlY5VMKlUB5vwguYrzalzk9ASne6PWXkjY6IddhHx/zFgg/w0coZg6VI
         BEZ71jAKzU+cEIdL5vwx7ZMt/7mGBi1RT8eWCd9/PIUmEu665Efcc6QpI+6Q+5G8fhWM
         AkpZLP6Ck883l8BNqoWDMoOPeZ6w0bjRt+ixXCmVPZt/vPw4lWpxvArZs5vBwS3XVgxz
         FqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785574706; x=1786179506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ot7Bn3ZEURQrk42Oh0sapiZcIWCpwwKzFXd66di2HQw=;
        b=H/jFBmFaVTyii6B8k/UGbXnyFgTkWeN2f8XgdXFsetqfaJ1TsV2K+eI9iZPVMrxYEk
         yvbD3n0WOAgSlLl0MI/PXsRhAUG1YvQgHUTZWr6aqOxmbHoCUXe/21YO/NBj9bR4qBr8
         vzveNkmMSxupjmLPNlPqKgQTR8BuqnqUwpRa42KPjHzmdr9xeLIOaAQDNcyUPGmMU4PW
         et137QSLDvxOSWqrquvxld6grncYqQ2f7hMfhq2YlcwFd3JkSuWUiej4akujrWFitHP1
         llkukw6Nso7w5sTHO3n1DmOJnmd7Iuif3/hlN//ror1Ps40l+miqf32rtgMDARnk6Bwr
         vutg==
X-Forwarded-Encrypted: i=1; AHgh+Rq43mWaQdDhQIpzI1vWiAJMcmzG9jo3VAB6s9Ll+wQPYa5nzRPMdEhIPW2iEvBiM6naYN2U5xGkaLI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWHov12g1Yo5aNWosI5lv6F+EWzXjdpPWn7indH/VoYv5URRt4
	SwsooRiAHGVFHeb0JnrjjQA6KX0PTbhFMVLZsv131kQgtcIzgBiOC7fzQnRyz/1C/nGLgnFc3CQ
	f7k0y1HPttSFE6c6gCdM5Rr9ImorT9ja5eUjLZ40BvA==
X-Gm-Gg: AR+sD11bIs9RZk9aDCe0fAjN+1TKiyYC6pygV3MWsakXUbnQRp3ShRRzxdpLyhG5hx3
	nE145OUGLgFy2tncglo27YTyOxE2g4Lpod6fGYQ1Iop9D+ID/1blF6ZlknpZfqVn2T88NxOjjLA
	JWW5/JsIDlFs3ZhMLhRo2emzqzLfFFeKVgj3EZ5cUGvi7RTCRoC20DWgFrrv5uEcNFu/ot1Jf7v
	Gq1ukE+UVFrwr8qr3fFM+1pyhAcAN2D/Eji6pE4S1FYTvLJA6IJ79hsrG0EYp2q1GMrcSN1e1Fy
	g+3o70hocflKtXZs9ivsvZ3V38I5KvcVrRHbUt/oHzyAOaYAE7OETgTJNAYCEtL7LePBkdhsqiv
	KRPbD7/31SCR1nk4vjZdXJtvjaLYeFmhjaIvegrhrjGom2Ty1ncmn9G1wTJgphN3/
X-Received: by 2002:a05:6512:1093:b0:5b0:1df9:2adf with SMTP id
 2adb3069b0e04-5b2e4f3cf51mr582135e87.28.1785574706057; Sat, 01 Aug 2026
 01:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260716073756.44153-1-min_halo@163.com>
In-Reply-To: <20260716073756.44153-1-min_halo@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 14:28:13 +0530
X-Gm-Features: AUfX_my5qj7P0Pupl53QfIIfW1LsY1looLvmcDl2m-c-rMFrzQ4zMY72aHpKZiA
Message-ID: <CAAhSdy2eTsxG=aoXb=LqG6+=mthMcwTY6cZOi+NSvzHJ0s7r=w@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Fix infinite loop in NACL hfence entry allocation
To: Zongmin Zhou <min_halo@163.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_015828_142912_D0863EAE 
X-CRM114-Status: GOOD (  16.72  )
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

T24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgMTowOOKAr1BNIFpvbmdtaW4gWmhvdSA8bWluX2hhbG9A
MTYzLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBab25nbWluIFpob3UgPHpob3V6b25nbWluQGt5bGlu
b3MuY24+Cj4KPiB0cnlfY291bnQgaXMgaW5pdGlhbGl6ZWQgdG8gNSBidXQgbmV2ZXIgZGVjcmVt
ZW50ZWQgaW4gdGhlIHJldHJ5IHBhdGgsCj4gbWFraW5nIHRoZSBgaWYgKHRyeV9jb3VudClgIGNo
ZWNrIGFsd2F5cyB0cnVlLiBJZiBhbGwgTkFDTCBzaGFyZWQgbWVtb3J5Cj4gaGZlbmNlIGVudHJp
ZXMgcmVtYWluIGluIHRoZSBwZW5kaW5nIHN0YXRlIGFmdGVyIHN5bmMsIHRoZSBmdW5jdGlvbiBs
b29wcwo+IGZvcmV2ZXIsIGNhdXNpbmcgYSBzb2Z0IGxvY2t1cC4gRGVjcmVtZW50IHRyeV9jb3Vu
dCBvbiBlYWNoIHJldHJ5IHNvIHRoZQo+IGZhbGxiYWNrIHdhcm5pbmcgYW5kIHJldHVybiBiZWNv
bWUgcmVhY2hhYmxlLgo+Cj4gRml4ZXM6IGQ0NjZjMTljZWFkNSAoIlJJU0MtVjogS1ZNOiBBZGQg
Y29tbW9uIG5lc3RlZCBhY2NlbGVyYXRpb24gc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogWm9u
Z21pbiBaaG91IDx6aG91em9uZ21pbkBreWxpbm9zLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExp
bnV4LTcuMwoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9uYWNsLmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL25hY2wuYyBiL2FyY2gvcmlzY3Yva3ZtL25hY2wu
Ywo+IGluZGV4IDZmOWY4OTYzZTlkZC4uOWFmZjAzYzRmNjY3IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL25hY2wuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL25hY2wuYwo+IEBAIC0zMyw3
ICszMyw3IEBAIHZvaWQgX19rdm1fcmlzY3ZfbmFjbF9oZmVuY2Uodm9pZCAqc2htZW0sCj4gICAg
ICAgICB9Cj4KPiAgICAgICAgIGlmIChlbnQgPCAwKSB7Cj4gLSAgICAgICAgICAgICAgIGlmICh0
cnlfY291bnQpIHsKPiArICAgICAgICAgICAgICAgaWYgKHRyeV9jb3VudC0tKSB7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgbmFjbF9zeW5jX2hmZW5jZSgtMVVMKTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIGFnYWluOwo+ICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+IC0tCj4g
Mi4zNC4xCj4KPgo+IE5vIHZpcnVzIGZvdW5kCj4gICAgICAgICAgICAgICAgIENoZWNrZWQgYnkg
SGlsbHN0b25lIE5ldHdvcmsgQW50aVZpcnVzCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
