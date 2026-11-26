Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193AD606A329
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FFo7AwbO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KSTtVC5p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sG3+cvUDt8nX84Q2pSwCDM6CYI1khhpgXFhbcgNo87s=; b=FFo7AwbO/ZgktVw18pi5QUg80w
	hRyv9wWp8Fwm5MyVXIXbOBJACht5QxnOq908TwZa290r6mzHhd9nRJ3cecv6i+Z3Wz7jK+7H3N1Ov
	eo9N3c4E7FZnmhHq37s/xa0FqRdaW/RPSVsZ/9MvsmHbBNfoWe+OXwu73jVHzkmTu0A9YUamansf2
	8BmEBC2lWPW/pr0L5bbe7/fSg9FtKT8eqh0ZMEdHb/37JFe60rke4Vhq+x71opmK+pDNVtdxD1m/a
	5DdOm5+a0703omyAeZvW1ezIqUyOGdIdlctGR0GYxNFE/DkapVHZ2r74RoEE/y/rsnYQA/ZUat1PM
	Z6HQ3pJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaPM-0000000DXbo-3EUB;
	Thu, 26 Nov 2026 14:25:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaPL-0000000DXba-2Jvp
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 14:25:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0747F63566
	for <kvm-riscv@lists.infradead.org>; Thu, 26 Nov 2026 14:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB1A1F000EB
	for <kvm-riscv@lists.infradead.org>; Thu, 26 Nov 2026 14:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795703106;
	bh=urzqIBJWhB3yp5cZJ6SMEI3ey7WIN+40bKxuYnpO/4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KSTtVC5p+dd+ataqWAVi5gHO8ZRd/RWVkYxhg/g/6O/b1O/+IcyQVPR4Ck5hWhnsj
	 GLpAIFYIBB5z2571wc7HKkORsM4fGd2pHKEKF7CrFmBUK9GHlZlvsh0hLH587a4p5w
	 6m9f+F7ygqG8eE340zHJOL51FHRno+Rd7yaTs2PQ3ubV7VgPuPyNtRzlBssWo1dJg5
	 HlxlOHtvH2LQOtja8acqQmaeadF2/6pD81nSo5FoCrVstAIZUgRNq4CiLOZr+r8Byn
	 /1dXa0dlXWgYRR1aY13eLfugSGd6HmHXAAZemCmuxbcEzHpQsdXY0KX6TNk/GEP3MF
	 m+PlAIFxLV9oQ==
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so68850135e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 26 Nov 2026 06:25:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHlf3cqNyjT8IqhYlpMmjCFR+hUsMMjgSfFxSZ2DdQBD9cwKF3A0jUAq++zyLtSDb+AgVCer0/EXoc=@lists.infradead.org
X-Gm-Message-State: APuU4Z+v5IYMVpYJCAnDri+rgH3pnVZtX+Vj/z/yAS1JyT7rN+vcUmQj
	Nc5A0m6GoueNhGPtJsOw7lDmk2d/tai7622Q7q3ZPit9/XTbFZcuHZRT9goaKQcmBqnnmACBkyG
	KxUXQikVNIRsjoR6csYKB3TZ9apMLSzA=
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id
 5b1f17b1804b1-4bb888267aemr431006395e9.10.1795703104940; Thu, 26 Nov 2026
 06:25:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260924-free_bitmap_initialized-v1-1-4cfb73a0d04b@kernel.org> <CAAhSdy0cfbfufYYhVCz6Tq0_1RrS0DEi5yfKyBJr=WhUnd+QZg@mail.gmail.com>
In-Reply-To: <CAAhSdy0cfbfufYYhVCz6Tq0_1RrS0DEi5yfKyBJr=WhUnd+QZg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 26 Nov 2026 22:24:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQJO-sGxTNUoVvU4bGcqPXJb6tpiVsyEPJP25Z7wjduNQ@mail.gmail.com>
X-Gm-Features: Aa3M54qmSzszE-VR_RYTsVczrtCxMOXKk85r4dogNtwI2ZjOSGsCbY_eqm9_ZQU
Message-ID: <CAJF2gTQJO-sGxTNUoVvU4bGcqPXJb6tpiVsyEPJP25Z7wjduNQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: AIA: Initialize per-CPU HGEI free_bitmap
 only once
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQW51cCwKCk9uIFdlZCwgTm92IDI1LCAyMDI2IGF0IDExOjM14oCvUE0gQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCAyNCwgMjAyNiBhdCAx
MTozNOKAr0FNIEdVTyBSZW4gKFh1YW5UaWUpIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pgo+ID4ga3ZtX3Jpc2N2X2FpYV9lbmFibGUoKSBtYXkgcnVuIG1vcmUgdGhhbiBvbmNlIG9uIHRo
ZSBzYW1lIENQVS4gIFRoZQo+ID4gcGVyLUNQVSBmcmVlX2JpdG1hcCBvbmx5IG5lZWRzIHRvIGJl
IGluaXRpYWxpemVkIG9uY2UsIGZyb20gdGhlIEhHRUlFCj4gPiB3aWR0aCBkaXNjb3ZlcmVkIG9u
IHRoYXQgQ1BVLiAgUGVyZm9ybSB0aGUgSEdFSUUgcHJvYmUgYW5kIGJpdG1hcAo+ID4gc2V0dXAg
b25seSBvbiB0aGUgZmlyc3QgY2FsbCwgYW5kIHNldCBmcmVlX2JpdG1hcF9pbml0aWFsaXplZCBh
ZnRlcgo+ID4gdGhlIGJpdG1hcCBoYXMgYmVlbiBwb3B1bGF0ZWQuCj4KPiBUaGUgcGVyLUNQVSBm
cmVlX2JpdG1hcCBmb3IgSEdFSSBsaW5lcyBvbmx5IG9uZSB1bnNpZ25lZCBsb25nIHNvCj4gSSBh
bSBub3Qgc3VyZSB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIHNhdmUgYnkgc2tpcHBpbmcgb25lIHVu
c2lnbmVkIGxvbmcuCj4KVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBUbyBjbGFyaWZ5LCB0aGUgZWFy
bHktZXhpdCBza2lwcyB0aGUgZW50aXJlCmJsb2NrIGJlbG93IOKAlCBub3QganVzdCB0aGUgYml0
bWFwIGFzc2lnbm1lbnQ6Ci0tLQovKiBGaWd1cmUtb3V0IG51bWJlciBvZiBiaXRzIGluIEhHRUlF
ICovCmNzcl93cml0ZShDU1JfSEdFSUUsIC0xVUwpOwpoZ2N0cmwtPm5yX2hnZWkgPSBmbHNfbG9u
Zyhjc3JfcmVhZChDU1JfSEdFSUUpKTsKY3NyX3dyaXRlKENTUl9IR0VJRSwgMCk7CmlmIChoZ2N0
cmwtPm5yX2hnZWkpCiAgICBoZ2N0cmwtPm5yX2hnZWktLTsKCmlmIChsYykKICAgIGhnY3RybC0+
bnJfaGdlaSA9IG1pbigodWxvbmcpaGdjdHJsLT5ucl9oZ2VpLCBsYy0+bnJfZ3Vlc3RfZmlsZXMp
OwplbHNlCiAgICBoZ2N0cmwtPm5yX2hnZWkgPSAwOwoKYWlhX25yX2hnZWkgPSBhdG9taWNfcmVh
ZCgma3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpKTsKZG8gewogICAgaWYgKGFpYV9ucl9oZ2VpIDw9IGhn
Y3RybC0+bnJfaGdlaSkKICAgICAgICBicmVhazsKfSB3aGlsZSAoIWF0b21pY190cnlfY21weGNo
Zygma3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICZh
aWFfbnJfaGdlaSwgaGdjdHJsLT5ucl9oZ2VpKSk7CgpyYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmhn
Y3RybC0+bG9jaywgZmxhZ3MpOwppZiAoIWhnY3RybC0+ZnJlZV9iaXRtYXBfaW5pdGlhbGl6ZWQp
IHsKICAgIGhnY3RybC0+ZnJlZV9iaXRtYXAgPSAoaGdjdHJsLT5ucl9oZ2VpKSA/CiAgICAgICAg
R0VOTUFTS19VTEwoaGdjdHJsLT5ucl9oZ2VpLCAxKSA6IDA7CiAgICBoZ2N0cmwtPmZyZWVfYml0
bWFwX2luaXRpYWxpemVkID0gdHJ1ZTsKfQpyYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaGdj
dHJsLT5sb2NrLCBmbGFncyk7Ci0tLQpPbmNlIGEgaGFydCBoYXMgYmVlbiBpbml0aWFsaXplZCwg
bnJfaGdlaSBpcyBhIGhhcmR3YXJlIHByb3BlcnR5IHRoYXQKd29uJ3QgY2hhbmdlLiBSZS1wcm9i
aW5nIENTUl9IR0VJRSwgcmUtcnVubmluZyB0aGUgYXRvbWljIGNtcHhjaGcKbG9vcCwgYW5kIHJl
LWFjcXVpcmluZyB0aGUgaXJxc2F2ZSBzcGlubG9jayBvbiBldmVyeSBzdWJzZXF1ZW50Cmt2bV9y
aXNjdl9haWFfZW5hYmxlKCkgaXMgcHVyZSBvdmVyaGVhZC4KClRoZSBmcmVlX2JpdG1hcF9pbml0
aWFsaXplZCBmbGFnIGluIHRoZSBvcmlnaW5hbCBjb2RlIGFscmVhZHkKYW50aWNpcGF0ZWQgcmVw
ZWF0ZWQgY2FsbHMuIFRoaXMgcGF0Y2ggc2ltcGx5IGhvaXN0cyB0aGF0IGNoZWNrIHRvCnNraXAg
dGhlIHJlZHVuZGFudCBwcm9iZSBlbnRpcmVseS4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4K
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
