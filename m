Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02C2F3ED59
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RI2TFyE0LAL/T88BwnJo1W5vfvMWUCuk3mVW1cXW1iE=; b=KXg1qJFMb8wiM3
	hnqZybyH8piRaYBaLp8uoUm5289zVUrfDCYrcvWwZVTkYr4MM7Ewwvnua0Ptz5IKP/zKhstEUUIJ0
	hT9biGOnZ+WypHQyUP7NZGwpwZdMmjqsDap+HIVsYRuBoDdnRxAEk2vzS9NTlPSWmDB4VGC8hhReI
	h2fFRAyq6z9Z9I+1U4u70VLAfRq/Njrmeu8byjoY73qFiEnHkSngdVeVZqMsNNAivFmsgGTulzfBa
	ENxd94wWfmB98QRR6cOwsnQZ+N5PvTuPiJe6dYCxzFRW8fPYmS/7rx7z3lHiOEUHwL5i9vSQkozof
	pfgssmFA8svXSAd9H1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBbZ2-0000000DeI1-13rL;
	Sat, 11 Apr 2026 16:52:08 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBbZ0-0000000DeHK-27Vw
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 16:52:07 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7dc3d28e2f3so463164a34.0
        for <kvm-riscv@lists.infradead.org>; Sat, 11 Apr 2026 09:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775926325; cv=none;
        d=google.com; s=arc-20240605;
        b=lwltlqNcX/LLXa0MM79pvxX0uo2psHPW53g0nGp1GQGhz7K5P+JvcnsUziAmaxV9sc
         VHZuMs8cb2btt/I2WGQG6sbNN1DUgudJuWy1c44bcBz3lYHTH0F0kMM7DN2ZtXOHllkQ
         BVtl9OJ/CVGhmJONo81Nw4R2aGF9oaK8uV19WlqETYK51RqgI2/xih8XbWOxuKPheDbM
         CEK1Lgzl/wYUYoOQ4YPSbOY6y53/ofycmcMr+7Xj5U5NwEUmvvWFBpkN8La0Kb8xDS0M
         yJaBgPcRFu0tH0/TlOyAozBhXz/Q1FPTQOVrI4CLH1ihDDnkBz+U34xYNfAsiwDc8FW+
         +xag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wqSJZdgJoODeu8kv1hRE+cGfzsSFkA9szelcDJzZHDc=;
        fh=as51i96KTcDzM+IlxpB1Si6HCwnhkZ831ACGe8pM1/U=;
        b=bjTK0EMnz6qSCjtyt6F/mfEr7a8FsFhIAioUPUFrUXWwuB3e0/hJDaa0AIan6TY7VM
         mvuAKYCpQJn6tEOhfOkNQUfZT+8EoUSoJyQV5hlGxyRD5HjiOkSetRWGYQU5Ol848vIm
         Yd5bwBUfSjjeeOe/YnVcl90yIjTVII9NtWue2IYHhtQxGF5Drq0p452c1TD2CK89YiLT
         tA/UW5liHRHmB4VyAyPllZKlzIP1puLZbtpnvpzL6JNOZwq59/MPLMvksbfYRfw1hpeZ
         V8QYooo6NuyKv8hVz3ymesyNDlbS/geSeXDkBvQ0+ltALvET8UQFW3HtLEwOz9mHhxzP
         uBBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775926325; x=1776531125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqSJZdgJoODeu8kv1hRE+cGfzsSFkA9szelcDJzZHDc=;
        b=rhd8XWd1aPrb19mRpK3ROc4+KunxU+t643dFlN1GU25LiY1yR+OOo5F1+kuc1hx24h
         25UgqGIkyGjkGmW7uwaEw2Ft07WuhBkOQfYPdtIYea3ZV34BXUgmzj53S2sjG1XUoOV/
         MHV0P7o1gnbmWQkv7ABGC8n0xOtearCNt37+zKFjkfz4m1m53Xg8E26qfeEqH9r00Ggw
         form81hp57/BEUohlqb6mwm38BDs3C+1XgdIrw8BTxuAj9IPLPA2gMFYUcz3GL+Zf3aS
         gK6UbbMWibjxZDbPSWpXF1bKdNeRqsXL5AISiR79KPsdf2Yy9Kkeu1NZs+PMukwQwDf8
         +nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775926325; x=1776531125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wqSJZdgJoODeu8kv1hRE+cGfzsSFkA9szelcDJzZHDc=;
        b=PCDUcd1+3LmSw/13w6hjY2EgAv4R7QZY/4JPrYMwgiXVfsnmPX+Uy5Vkjlpqo67p2m
         hMyZJCFEYrZ9/9LtaBSvFhCnhSwpGYZ0Aw61wR6okVu3k/D3VXyVqlaQqlqSytmFfIrC
         5mNM4BuoadfJeF4GOJYPy1m/i3VeaJjepMm6/KzliCWDPO+4DvqfFT9VtU39m8meH6Ir
         UjioHD0CwfA9kU/u6o24UkysDrJvYIZ8NiyA7orRkxshkStmCvM/IgaL98mQ18mFPCCy
         KNJ6WLvvf6lPQeKYm8Y0wg6KeqmZoGT6vpKAxbUuAqOXWI+MTGQ6sj+V1C9ss8jMqupf
         9fHg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Rri0GwRMoxiOhbPRPBg7jfoL9omYxOkqbkqPrGdu5pfwlfu6tZHiKHS4tV5838K4rBn0TUsdxuc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIkOCJ1uGaiWqv0uKPgu3TsQ4qPjqa2NiAxftSQjmNsl7IKflg
	65BfN6FExiNbpVH9lFjqPdK+riX/TXQeaf58/i83TfrrXe2tLaXb/4TWr15ANAuf+/hLrjdW7Z/
	5EwEy3xgmXs61Fe7AJejnrBPcHhq9oBlU5YGp8IWO1w==
X-Gm-Gg: AeBDieuk8hM9Wx0cmj6tk4a63vAdBz+VXsW1HowwRxMkYPnrhnercgEeVm7DmS69V2p
	6pXIGJ5HoGxbBGkX+yC0BxSh+1VFaa+zzK0Mz6CUHZYHOcJkvP4D/NJD4cBlIEhUC1QFDjXxIrY
	+q83zwPO631DI2AL7fPqmge23GlExl+0I3co8sO03hP+Xnl22EBnHNNyiBqs9UF1vE4kRybzj3D
	UDDN6nvZGxWCfG6nESjGKttW8DtD2M4Rm7u3n+BCRvIRUBz2TuC7At+o3eked8ZRpG3Hw3PXgPg
	YWtRVTW/nQUZhORQFEOp5ee7ygwQdkhG5yin+GRbyoxefatveDAXn5QcQMBLHGEyrIupK88MzSk
	5izMmlzoDRtBGV/605cZPNlGHugU=
X-Received: by 2002:a05:6820:8183:b0:67e:1c67:ebd8 with SMTP id
 006d021491bc7-68be7ee1b88mr3330520eaf.40.1775926324573; Sat, 11 Apr 2026
 09:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com> <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 11 Apr 2026 22:21:53 +0530
X-Gm-Features: AQROBzC78r2FyJGwEr-mo33bIJuUYfyNgNHxCIGcYlLjmwSOUrGfuQso79gUj30
Message-ID: <CAAhSdy3EdaQaPpBCWj9AP0nmB4XP_ApqC6E9XMuJZuH19j3fPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V
 Svpbmt bits
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com, 
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, guoren@kernel.org, 
	iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_095206_578185_D6A280CE 
X-CRM114-Status: GOOD (  14.74  )
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

T24gU2F0LCBBcHIgMTEsIDIwMjYgYXQgNzo1MuKAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBXaGVuIHRoZSBSSVNDLVYgSU9NTVUgcGFnZSB0YWJsZSBmb3JtYXQgc3VwcG9y
dCBTdnBibXQsIFBCTVQgcHJvdmlkZXMKPiBhIHdheSB0byB0YWcgbWFwcGluZ3Mgd2l0aCBwYWdl
LWJhc2VkIG1lbW9yeSB0eXBlcy4gRW5jb2RlIG1lbW9yeSB0eXBlCj4gdmlhIFBCTVQgaW4gUklT
Qy1WIElPTU1VIFBURXM6Cj4KPiAgIC0gSU9NTVVfTU1JTyAgIC0+IFBCTVQ9SU8KPiAgIC0gIUlP
TU1VX0NBQ0hFIC0+IFBCTVQ9TkMKPiAgIC0gb3RoZXJ3aXNlICAgIC0+IFBCTVQ9Tm9ybWFsIChQ
Qk1UPTApCj4KPiBDbGVhciB0aGUgUEJNVCBmaWVsZCBiZWZvcmUgYXBwbHlpbmcgdGhlIHNlbGVj
dGVkIGVuY29kaW5nLCBhbmQgb25seQo+IHRvdWNoIFBCTVQgd2hlbiBQVF9GRUFUX1JJU0NWX1NW
UEJNVCBpcyBhZHZlcnRpc2VkLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUu
eXVAbGludXguYWxpYmFiYS5jb20+CgpMb29rcyBnb29kIGZyb20gUklTQy1WIHBlcnNwZWN0aXZl
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRz
LApBbnVwCgoKPiAtLS0KPiAgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9yaXNjdi5oIHwg
OSArKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaCBiL2RyaXZlcnMvaW9t
bXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaAo+IGluZGV4IGE3ZmVmNjI2NmEzNi4uMDIwNTFiYjNj
NmU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaAo+
ICsrKyBiL2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaAo+IEBAIC01OCw2ICs1
OCw4IEBAIGVudW0gewo+ICAgICAgICAgUklTQ1ZQVF9HID0gQklUKDUpLAo+ICAgICAgICAgUklT
Q1ZQVF9BID0gQklUKDYpLAo+ICAgICAgICAgUklTQ1ZQVF9EID0gQklUKDcpLAo+ICsgICAgICAg
UklTQ1ZQVF9OQyA9IEJJVCg2MSksCj4gKyAgICAgICBSSVNDVlBUX0lPID0gQklUKDYyKSwKPiAg
ICAgICAgIFJJU0NWUFRfUlNXID0gR0VOTUFTSyg5LCA4KSwKPiAgICAgICAgIFJJU0NWUFRfUFBO
MzIgPSBHRU5NQVNLKDMxLCAxMCksCj4KPiBAQCAtMjM3LDYgKzIzOSwxMyBAQCBzdGF0aWMgaW5s
aW5lIGludCByaXNjdnB0X2lvbW11X3NldF9wcm90KHN0cnVjdCBwdF9jb21tb24gKmNvbW1vbiwK
PiAgICAgICAgICAgICAgICAgcHRlIHw9IFJJU0NWUFRfUjsKPiAgICAgICAgIGlmICghKGlvbW11
X3Byb3QgJiBJT01NVV9OT0VYRUMpKQo+ICAgICAgICAgICAgICAgICBwdGUgfD0gUklTQ1ZQVF9Y
Owo+ICsgICAgICAgaWYgKGNvbW1vbi0+ZmVhdHVyZXMgJiBCSVQoUFRfRkVBVF9SSVNDVl9TVlBC
TVQpKSB7Cj4gKyAgICAgICAgICAgICAgIHB0ZSAmPSB+UklTQ1ZQVF9QQk1UOwo+ICsgICAgICAg
ICAgICAgICBpZiAoaW9tbXVfcHJvdCAmIElPTU1VX01NSU8pCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcHRlIHw9IFJJU0NWUFRfSU87Cj4gKyAgICAgICAgICAgICAgIGVsc2UgaWYgKCEoaW9t
bXVfcHJvdCAmIElPTU1VX0NBQ0hFKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBwdGUgfD0g
UklTQ1ZQVF9OQzsKPiArICAgICAgIH0KPgo+ICAgICAgICAgLyogQ2FsbGVyIG11c3Qgc3BlY2lm
eSBhIHN1cHBvcnRlZCBjb21iaW5hdGlvbiBvZiBmbGFncyAqLwo+ICAgICAgICAgaWYgKHVubGlr
ZWx5KChwdGUgJiAoUklTQ1ZQVF9YIHwgUklTQ1ZQVF9XIHwgUklTQ1ZQVF9SKSkgPT0gMCkpCj4g
LS0KPiAyLjUwLjEKPgo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
