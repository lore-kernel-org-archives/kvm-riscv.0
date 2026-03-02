Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62B0E9B37D
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwEUPHn5ZeT2BOKA28G7iY9a3U0Ojb1pEWQbaTQiQ18=; b=jqYSojG9ekOz6s
	jbT5GsXQr/iPZME+O9bM4txPw3P68eD7DRUaqVT+dlMjTNGzFODLpQgOFTPvS1EAKPrhRajOkDpmw
	rvu3OeabFbkOnLPrH9+EWKue7UZBeWkL4DEwmxFYMH82XAyxbNFXL1DZaa72pnhIIxZb72wqKID14
	ZVPMXa30/2UeqUwO0TYC5vbc0njhzZfD9Ex7XD1oqC2zjC2TROWOrebJhO0soPgQf8tEcLxy0+ggB
	IVKIQbYzaIuJXyHhIYDLkLUuS8RRfNURLNHygCQ7U7yGWCg2sG3sCm/tOqwP1EPhGn+GEDEN9AxXP
	HHuWdC2y4LiztdDs0D4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx36B-0000000D4rk-1Y6Y;
	Mon, 02 Mar 2026 13:14:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx369-0000000D4rM-3i31
	for kvm-riscv@bombadil.infradead.org;
	Mon, 02 Mar 2026 13:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=q2A3GQhW+RrNinQHVvkLJ5ITVUV3MtufvJzOYRFjrHY=; b=bufVgFG4pqtdHObPhsZZqTcq5g
	xZclexauRVaDL17EqH3E4hVzWwVpkhm3rr73ZbFlZUec3trmamKdrLS9GaB9x2/8ViDuwPeXA0NZy
	pYM42BJ6qWZ00NZdjWA7Dbj6EvznFyRq/kz7rYgX9pBNL2on1EBJhlFPIsdRCuKH0gxnlJWdY7JjQ
	LTA2+QPhAMXzcao0cIjBD4nlC+DP7NSAYIRFB8UL7s81utj3WAufXRYHh6cYzYcnVHdI4NFMb0WSA
	TIF31nvu0Li5JysZnswJlbJKGJFKedqZKbkz+NGDPrPNlFY7/VDNb3Dpo0wiASzHn3d0Xi8VPtE8U
	cFzknuUQ==;
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx366-000000008Mz-2ULM
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 13:14:08 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7d18c654458so2149272a34.3
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Mar 2026 05:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772457245; cv=none;
        d=google.com; s=arc-20240605;
        b=imO2zAipacvf24DjGBRFFDwbKXHw4PY983RiFYhuVEoWGfextUv2N+Ju9NiRsDgrRx
         BLp7qZ3TbBW15yfj95u4VdB0XK3R8Yf7QGCiw6S08acyVfoYFk9rLZ99H7Au2kWf0XtN
         G5WQM2iOfv1CToB3G1pV61OcXLZ0CdhZ0ms90BtesuC8UHGAO+xGNylfX9eG+c8VxXT+
         vXDcZRmE6+j0H2vzOmitnbEA7PRk3ar5HHwMTnNwooz6a0HtYJJ00dc7Y9YtC1QhNtUJ
         xp1rVZjib8cJX2jQ0AwMshz7Hy5RTPN8stwyR77SibPTtwyYvzkB2YQSjZd/YS9vcpYS
         5ixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q2A3GQhW+RrNinQHVvkLJ5ITVUV3MtufvJzOYRFjrHY=;
        fh=LDA7uFr9HQ9j5m98vNs8X253yE9VN04ThWHoroXl7Hk=;
        b=hL+IgklszRXyr0+TrdbqpHdduxpOUo/3b/dDMMkh2Rkmx9ZcHlOhwJKBzNapL4NE4/
         3dzbqxJTG7cjLccU0ulLoEBymZh8G/6XJ28GHAqi2amhA+sICaG2L2PTTIsKteEOcD2A
         xanFNyiGehPKFIRQlXsOKv0Q/MLvHkhAESVMn+Cn0VoYyVGvXQtcbo8yW3kWr2AeW4Nw
         Ulv4mLvzItNuEN7IxsEGK6Z4cEMe/q6GT0a7QTC4ocq5aPWU+ltzDzSawZ+EMOpRRMYX
         juL5T2+nA8g5jiJaB9OJlk9XnJqXuO6O5c8mvswPwzxRPG3642yo7UamulRpgMw2T+wK
         G59Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772457245; x=1773062045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2A3GQhW+RrNinQHVvkLJ5ITVUV3MtufvJzOYRFjrHY=;
        b=JVpT1K2bCOc59TPx66fZWBE90wTEVwBfBb2YCrBtPi8GDFjj5DZRywdzRCHH498+7b
         082sQsLi2PtjDQrdDVHfFov/PAwz0o01/zr5FKFGAgoHeLc8Cd5+r5qVFP7242++G63o
         LM4EGQlhcyRxJvWzGRVa5xQtIquaFKgqmjGwTiGg2xIuuP/I3NUfFyXfFSFt3tK/TPD4
         bZo1PDlkHCdchqdqn0V8SoQ5R0d7vsuDppPy2BfrJSwtkO5O6T4BgckmclgLfB/M3fB1
         3sxQ34JOPAue7keJa/VDMCTojhjAEXZOLX/eJHhlxR+KohB1E/Vw2mOsZxphhhvDvkyY
         e/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457245; x=1773062045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q2A3GQhW+RrNinQHVvkLJ5ITVUV3MtufvJzOYRFjrHY=;
        b=WzZAwzm70dJ4GH4reogKKh9HaVuGjPM6jxju1CkaiGxtcjG6G3ciGdKCu4NSyc2XOI
         1wgpvDvc+lUmQIIGhmQAMGKvde1HtUOBoGCvqD87GqSRu5Rit9Aov12L9pYpflHVM+V4
         eKykDB69QK2lIrivtrv29PyXOkCsOAHpohscnMTGiMeI/iPx2yrNC+2CFGztag/NbcxK
         x9m1Ej3fdCEYWCWoKxGE0qCsUP/4pA5bVMw2QTTolOyDFAjfb4AG4aMznM2iE0fl41Ac
         eDqD16U39ixfHGUflj+hiv9xk2wJFNZkS8kwk7T3lB3ZHziVzyR9vmAX0PWwkT3l5y62
         IBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Y6hkSzUi+uuaf8ydjTUKGPLQHtK9iMJGGHDIhpQfczGCNa8S8HATAgxxQx2maioOU0wXletkdeo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEhpllBGe4kx/lYLTyRNmh58i4OGLlyiTVRzUrKgzeAgcTpPo0
	tcg1cIkCPo10PWXTPJzmefsRXDnznLwpUflRG2QHLx9xNPu8qWYvEkKVOAAcsm55atT8QqdB9wC
	E2Yvtx8X5UwiyrSVURzLiklUuVOrKWKc4Hc0ymA60Ig==
X-Gm-Gg: ATEYQzy/pF15KFQdLUpzfQj7FT5RzhXQ3B440sS3y4Prg25VeNhS+X8gBdwmJsvZ4ps
	6rzi+9+etArYm6VLEREymrDrih1bQEvpw9e5Oub03Uu/C32SPiCDoswRDYBrga/BGyM5wimxSW8
	1rJ5KEheDCjg/duZ5IFdRKn1vhZ6PM92WoVYKhyPZIon7b5wwVK7XwpH1GGMYoYAJdzwQM2ieMc
	Yt6iAXWOrzumxBriwiqZFnjTo8c1iexW8//3RXKe7nbnKQTXcjglIXd1lyNmqsQ2RmRMCI0dYg+
	7plZ1Dk6WSAJDEYcW1mkCIqsC+Wl6PoqusuoFvsTweoy0kMVyHmSIDSw4pu7XGlUSoaGmEionj4
	aSMXKAAqycfGqCPPV0vlOVOt4yQ==
X-Received: by 2002:a05:6820:290b:b0:679:9802:7cd7 with SMTP id
 006d021491bc7-679faf194bfmr5794292eaf.40.1772457244644; Mon, 02 Mar 2026
 05:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20260228152226.2116895-1-ethantidmore06@gmail.com>
In-Reply-To: <20260228152226.2116895-1-ethantidmore06@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Mar 2026 18:43:53 +0530
X-Gm-Features: AaiRm53b0DPXsxrpiSTrmcHPiPDsc5YZtwK0BzdP4iIWyQHt1ODVlWYlaZYCUFQ
Message-ID: <CAAhSdy0k416xVG9uiTYKgeqhMKZvKQbSSuqNaPgkgCQVTdvHBw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix out-of-bounds by 1
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_131406_747013_FEFE4F57 
X-CRM114-Status: GOOD (  17.27  )
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

T24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgODo1MuKAr1BNIEV0aGFuIFRpZG1vcmUgPGV0aGFudGlk
bW9yZTA2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgYXJyYXkga3ZwbXUtPnBtYyBpcyBkZWZp
bmVkIGFzOgo+Cj4gc3RydWN0IGt2bV9wbWMgcG1jW1JJU0NWX0tWTV9NQVhfQ09VTlRFUlNdOwo+
Cj4gU28sIGFjY2Vzc2luZyBpdCB3aXRoIGluZGV4IFJJU0NWX0tWTV9NQVhfQ09VTlRFUlMgd291
bGQgYmUKPiBvdXQtb2YtYm91bmRzIGJ5IDEuCj4KPiBDaGFuZ2UgaW5kZXggY2hlY2sgZnJvbSA+
IHRvID49Lgo+Cj4gRGV0ZWN0ZWQgYnkgU21hdGNoOgo+IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11
LmM6NTI4IGt2bV9yaXNjdl92Y3B1X3BtdV9jdHJfaW5mbygpIGVycm9yOgo+IGJ1ZmZlciBvdmVy
ZmxvdyAna3ZwbXUtPnBtYycgNjQgPD0gNjQKPgo+IEZpeGVzOiA4ZjAxNTNlY2QzYmYxICgiUklT
Qy1WOiBLVk06IEFkZCBza2VsZXRvbiBzdXBwb3J0IGZvciBwZXJmIikKPiBTaWduZWQtb2ZmLWJ5
OiBFdGhhbiBUaWRtb3JlIDxldGhhbnRpZG1vcmUwNkBnbWFpbC5jb20+CgpSYWRpbSBoYWQgYWxy
ZWFkeSBzZW50IGEgc2ltaWxhciB3aGljaCB3YXMgbWVyZ2VkLgpSZWZlciwgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI2MDIyNzEzNDYxNy4yMzM3OC0xLXJhZGltLmtyY21hckBvc3MucXVh
bGNvbW0uY29tCgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Bt
dS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9wbXUuYwo+IGluZGV4IDNhNGQ1NGFhOTZkOC4uNTFhMTJmOTBmYjMwIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3BtdS5jCj4gQEAgLTUyMCw3ICs1MjAsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11
X2N0cl9pbmZvKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+ICB7
Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3BtdSAqa3ZwbXUgPSB2Y3B1X3RvX3BtdSh2Y3B1KTsKPgo+
IC0gICAgICAgaWYgKGNpZHggPiBSSVNDVl9LVk1fTUFYX0NPVU5URVJTIHx8IGNpZHggPT0gMSkg
ewo+ICsgICAgICAgaWYgKGNpZHggPj0gUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyB8fCBjaWR4ID09
IDEpIHsKPiAgICAgICAgICAgICAgICAgcmV0ZGF0YS0+ZXJyX3ZhbCA9IFNCSV9FUlJfSU5WQUxJ
RF9QQVJBTTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICB9Cj4gLS0KPiAy
LjUzLjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
