Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2788110F3DE1
	for <kvm-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 10:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9rjACKjECxr8uL5jeaJfvxwUxbDLQkRaj2S2fCuNkE=; b=Nt2WGqJ4nEnQxQ
	79vE5Orp6ub9FOekPJxoOz8Q2bi0oZq0wQAfdO4YnV8rD7tHlpBlU5mlorf2/i0xmooJ+szeM7uvE
	JMLAFIm9PhtWX0GznMwmmObibYmG6hbYFiHhCbMK4Iz+63xkS7RAlFhn6CACgq4SL7ECI1wUF2e3u
	UUbn4Vl/0ea1LCBNUlPFxh7FapGaB7H8J0h9E4z0sEvll86yYSL5yeoVphLmHWGYH1flQ+XzjnzM6
	bMkyQlkg0xwVJEZOKhBGSa1WbgDmEzuEAlcLKUEXKnyxKavmQw47+hdZXWHApfDGE+O9YWaW7Vx1h
	J8hYGPFrKTiymRllLrNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QZ4-00000008o4g-2Pkw;
	Sat, 28 Mar 2026 10:06:46 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QZ1-00000008o3w-3fMX
	for kvm-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 10:06:45 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-46aa216a65aso215285b6e.1
        for <kvm-riscv@lists.infradead.org>; Sat, 28 Mar 2026 03:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774692402; cv=none;
        d=google.com; s=arc-20240605;
        b=H1ULZYp3lMl8o+cModrMxlJ+XxGkHj++LpmwDKhYqdIMztYU5Qm+uuj3oLhi2pIuAP
         dF3xVwGEMYTfNkrXL9qQDfjyWJ3Kc/k6xCStehJ0IBNCiA/D8AbmbtCNvS6q/1R+t0Fk
         amaD7RiLSp87NBgujBClRn0QITCbRZ9KmKBp4LO/BSzbaDYz57VXdAdIH0JWU48BBbQo
         ZYtrOpKja3HoARww0URx8lskS4qCxgKJQmvDFjPT1DuAswszGZuTXxN46NbEfc0FepQB
         nVY8xJ1YFL8IKeBW9L1Tjn005dQZNZFWmIXwCAgw2DYhWGq8kiAMQ0muBtjIDi5CTk4R
         JPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hfk8WCjcSH9rv2rGOCgYWMqdh0uuxmNhxPE/XH9vGjo=;
        fh=7vY6ogDUVXw3X+INTuKv2bjdUmkQ++t8lqFa1SraWaM=;
        b=F+uc6WnWd+TqNm8ZUzlAgv1Vn2Hx1clRh/epv3vJnErMz37tIMqQbgf5/YOujwFTVi
         2xg7q3W6SWkrHTUR2pOpirCnFreJXmNj3/BV+QDLg7W9YMm9SXc9ZvU3RqOH7SOAqX5e
         JqKPxTtI3KRMF3VjZhtJIm55ePf0eZBMDwcGKGgEItboSBgLCDlwE5L+w84gPXP17tob
         JhwhBDPUkYXdHvytbs+e0612kCMRby8aIkufHanczXX5dwoNWXJrRJI877od49V6ECJj
         G7xQ9RAb/ZR51BkeZSexKi3eNzlzikORTFUsdJQAUgK+hIAbDc9z3dUvgHW1UYPaXUfS
         N/Ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774692402; x=1775297202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hfk8WCjcSH9rv2rGOCgYWMqdh0uuxmNhxPE/XH9vGjo=;
        b=ULQhz5YtlBvBxQwSdvI9ofdHqjmMqTrkEeqgB55aDP2vZ3VHLNj653kj8hlHtU97NJ
         g3sK5yFelFfJP6t7Rwr7oaEY3DtXhR4SZzIPM5TNfp2k8hdBZexRViro1PokC+GBfH/w
         eSlROWWsbc/CC7WGgkwjmF2CmPwfsPT/MYPidHJYsXg6rIXEPPsmgyGrcXeXLLdcKwMo
         ubxPUjrzUHfay+XCOxiDgcuj6GrqcP9p6Gm0bgsCSUHSjd2i/xYxG/kTMgNzMQGVRH3x
         xh7vl4fZDZmrbVGU7s8oyaVm6JcggAlM+L7gdATfNe0CR6YCBgIn4ClvvRhOZ36wqkkP
         fsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774692402; x=1775297202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hfk8WCjcSH9rv2rGOCgYWMqdh0uuxmNhxPE/XH9vGjo=;
        b=d7w3U34UvFiNwhyIvAJ4NXhDTWLE0Lml8V8vv5WlKWp/gOtQGCfNfNsB6LfnXNBaSr
         GcOfDYlAcoXno+BMkogEinXwj187ysZqEGIxEXeHXNAPu3zSmrJxnw5L1/k9ZuI1o8kN
         Z/HL1HNoYqmFD1dafgSBteSqfvpWzwnl3wOmq7wQIwlB9i122CzMyAWgi7y+HJoemGLc
         oVXXpb55XCiX8ivTWb+eK3dB/PKJWefzHj88oiOlzwmbWiZ0AUrCe4M7ICvl0wp8LP0e
         Eh/1H3EIWQGPDsuVJpqn3dYT2zxqJ0lkh8QKixufSw4r8uk69Uw4Vh0/ecEgZWN6A8fE
         IxRg==
X-Forwarded-Encrypted: i=1; AJvYcCU7cpAU3EdU8di1klSuQduQAvGGwyb0ze8quis/+E51fqG/ZrTOyH0GMMoqx6EInPolzrkasZ1tIio=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyla1RMEsh/fcOMvVgY4xPOGlHXA5L0o4hPHpPbHkGmjmLlz8av
	eMUqb8uyrhXZNJC8z7xvY5OBdbzvDGHnjHfzdFklmrbyKehZSX9fL76S7AMkrMLuiov4XwhQK3h
	jb824ArTI5j8MzTM1HcLQSKeZ4tnmqbZmYbsVRiZvEg==
X-Gm-Gg: ATEYQzxOn1rNq5TzTHn1MaZz4yuDwS57qqVEtr7tyBXII8FLHyCtz8rX7b39RzO6Jjw
	baKH3RLSoJleJVq4h9/9RXNDeFPSeJxdAH2UOnuFVQ7FkFA03JhjbQl4SOk2QwbTOu8/xVPgyBS
	rM5IjmMOasqNVbxxOXriJUd2ns/KwUpo+vw4yXuOR2x+tgtM4bbCNvbKv/A1FvH++jJpy+tj0NL
	LLEg7ewEdv4vlzMBEM77QGHyu8InC3Nt03A8j/TWwCD9j64z3L8aZ4Kgk33Sf8fIWe0bg5WqENg
	O4nMEaxwsAIsNSsxDg8SFpHsQikUSfkok11LE2EwFG5nomJr83SzF7IuonsTXEdaCNmHOCnIYV9
	mIUhdFac0apwdVojZNoVnhqPiTis=
X-Received: by 2002:a05:6820:1744:b0:67e:16b4:aa07 with SMTP id
 006d021491bc7-67e1877fb16mr2519511eaf.61.1774692402504; Sat, 28 Mar 2026
 03:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260328092157.75058-1-yufan.chen@linux.dev>
In-Reply-To: <20260328092157.75058-1-yufan.chen@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 28 Mar 2026 15:36:31 +0530
X-Gm-Features: AQROBzDbSN0ndaTo0i3wUYARAGuUJ9U0NfN66GMvIm76mGAmAZYGMorETfeVvDE
Message-ID: <CAAhSdy2uvN20G=fy4dRDqzkh_wKw9RyyMMM1p_A6g_HYYrSVjQ@mail.gmail.com>
Subject: Re: [PATCH] riscv/kvm: fix guest vector leak on host alloc failure
To: Yufan Chen <yufan.chen@linux.dev>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yufan Chen <ericterminal@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_030644_167911_1152B732 
X-CRM114-Status: GOOD (  14.40  )
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

T24gU2F0LCBNYXIgMjgsIDIwMjYgYXQgMjo1MuKAr1BNIFl1ZmFuIENoZW4gPHl1ZmFuLmNoZW5A
bGludXguZGV2PiB3cm90ZToKPgo+IEZyb206IFl1ZmFuIENoZW4gPGVyaWN0ZXJtaW5hbEBnbWFp
bC5jb20+Cj4KPiBXaGVuIGFsbG9jYXRpbmcgdmVjdG9yIGNvbnRleHQgZm9yIGEgdkNQVSwgZ3Vl
c3RfY29udGV4dC52ZWN0b3IuZGF0YXAgaXMgYWxsb2NhdGVkIGJlZm9yZSBob3N0X2NvbnRleHQu
dmVjdG9yLmRhdGFwLiBJZiB0aGUgc2Vjb25kIGFsbG9jYXRpb24gZmFpbHMsIHRoZSBmdW5jdGlv
biByZXR1cm5zIC1FTk9NRU0gZGlyZWN0bHkgYW5kIGxlYWtzIHRoZSBndWVzdCBidWZmZXIuCj4K
PiBTd2l0Y2ggdGhlIGZhaWx1cmUgcGF0aCB0byBjZW50cmFsaXplZCBjbGVhbnVwLiBPbiBob3N0
IGFsbG9jYXRpb24gZmFpbHVyZSwgZnJlZSBndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCwgY2xl
YXIgdGhlIHBvaW50ZXIsIGFuZCByZXR1cm4gLUVOT01FTSB0aHJvdWdoIGEgc2hhcmVkIGV4aXQg
bGFiZWwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWZhbiBDaGVuIDxlcmljdGVybWluYWxAZ21haWwu
Y29tPgoKVGhpcyBpcyBhbHJlYWR5IGZpeGVkIGJ5IHBhdGNoICJyaXNjdjoga3ZtOiBmaXggdmVj
dG9yIGNvbnRleHQgYWxsb2NhdGlvbiBsZWFrIi4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgfCAxMiArKysrKysrKysrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9y
LmMKPiBpbmRleCAwNWYzY2MyZDguLjRjMmY5MmRjZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+
IEBAIC03NSwxNSArNzUsMjMgQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9ob3N0X3ZlY3Rvcl9yZXN0
b3JlKHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNudHgpCj4KPiAgaW50IGt2bV9yaXNjdl92Y3B1
X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgewo+ICsgICAg
ICAgaW50IHJjID0gLUVOT01FTTsKPiArCj4gICAgICAgICB2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRl
eHQudmVjdG9yLmRhdGFwID0ga3phbGxvYyhyaXNjdl92X3ZzaXplLCBHRlBfS0VSTkVMKTsKPiAg
ICAgICAgIGlmICghdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkKPiAtICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+
Cj4gICAgICAgICB2Y3B1LT5hcmNoLmhvc3RfY29udGV4dC52ZWN0b3IuZGF0YXAgPSBremFsbG9j
KHJpc2N2X3ZfdnNpemUsIEdGUF9LRVJORUwpOwo+ICAgICAgICAgaWYgKCF2Y3B1LT5hcmNoLmhv
c3RfY29udGV4dC52ZWN0b3IuZGF0YXApCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Owo+ICsgICAgICAgICAgICAgICBnb3RvIGZyZWVfZ3Vlc3RfdmVjdG9yX2RhdGFwOwo+Cj4gICAg
ICAgICByZXR1cm4gMDsKPiArCj4gK2ZyZWVfZ3Vlc3RfdmVjdG9yX2RhdGFwOgo+ICsgICAgICAg
a2ZyZWUodmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCk7Cj4gKyAgICAgICB2
Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQudmVjdG9yLmRhdGFwID0gTlVMTDsKPiArb3V0Ogo+ICsg
ICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4KPiAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9mcmVlX3ZlY3Rv
cl9jb250ZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAtLQo+IDIuNDcuMwo+CgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
