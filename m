Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14F606A33D
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 05:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vkqOs7Hq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=nUL76c3I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrACFNX9x3vpCY1RuHDcKyMIlcdakkHTTxXmKOIuV9M=; b=vkqOs7HqrUCe32
	JvubhnzIjT6X9kIUKJQspyhEUhPM0HggaR/0NvhHZ0qw3KsYKNoxnETNmPgavcZneT+6iXkrE6Low
	RGPG01LjjtG0cRaRlbZLofl2p3emmhMfOjRlLMhfJwzLHRCYoAu3dxHTFG8U+v45+nbt3SHmx+Jct
	h/HzDE0baoU6y4exxG4ResQbq6SuMWXdl8X0seLRvmDYnQRZ+OjHnM2fk5glwF1M37QWE1DIlmaz7
	NKYKoUJImWB/BmuYc/ePhBEUVk/cK9gaEY7zKrXjVcTqZv1JfWIYN15WL32+DhXMnG3lxDqWvZcx4
	16XS4qeUIGu53F5g7UhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlDU-0000000DNFJ-0YfW;
	Thu, 22 Oct 2026 05:19:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlDS-0000000DNEc-0LB2
	for kvm-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 05:19:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48bbb06e746so830384f8f.3
        for <kvm-riscv@lists.infradead.org>; Wed, 21 Oct 2026 22:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792646388; cv=none;
        d=google.com; s=arc-20260327;
        b=NM/kqFiahnha8wAplDqSwUxgPyvTA5y2lzni38+2RQuonM5P2kut8a+/PF/eOnvJwV
         9Ae/naxx7sOeimsSEbyAuUb+xcKO/5IvOY+Fp5y7alFtjBKVNJb8QRZ9Aja9zJ5tr6qL
         /+yKvzwzQHxVJt5gwx98SKBgohPGBdZOMeKeieqxaiAdCBHeO8aS6QwFTqMu6k5nKf5H
         0rTQk/y0bz6nCxBUW6UGdHyxj5349IN+SNpf9oxnXtAvPHWj2aVb+3GXh+mobeqF7L7i
         vOW9rR4rI7vQ1cY33TAc3rxxFrthyEvjuGkIEkpM0RExIX1lLK5iQ064+ridJbRlKEni
         tyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HapPLVnPKNTi6siBORLQtk0Et4KzisGv9gkCpxoyz80=;
        fh=Iv2ws9j5Svu3nnAMsZmQbepRFX4CJrNjztUWG9MzRuI=;
        b=FgNAfGOA+jemuP9CdmiywnKne6ZPQlijKQGnZTR1cmhjJw0NS7WDG1F7ioDq6XNKqV
         yWmT3oyp0wtyGvzV3LEXBBf2V8yI6oG5ZUhR5GAok+1Ecj8gHs5tRv87eM0AjO4kZM/W
         g3mky/VHsP0XM/UZXTihuL7sX5snEkVXUOD6WUR1Q9CXDVMhvynTSgavga8pBSCJCdFN
         4oI2gZRkdy5DzPyXXSe6ka6f3wpzErp4GsKbJKXt3wf2fbSnXDdQlSBXraCGvwzD9L4K
         jeZnCNsa0ml/iE+sX7YqKv3BUxKgTiwq97Vhhmkv2/eFyQSgLZuX69YnUY4vIn/qco5b
         wvbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792646388; x=1793251188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HapPLVnPKNTi6siBORLQtk0Et4KzisGv9gkCpxoyz80=;
        b=nUL76c3I1CWxo7o9L2iiVGTlKZb2zDTIMD+Prjy41iVtGft/i9sbI/Wu9KJqLdDJCW
         sHbiiSUGCs2RwVOdjyQ3xGnhWv7/RIUJ/6bO0dUSWv62HUjA/PpgaNsUthVCU/Rxxa07
         5cLLgZ4nsiyMmUW7hf60F9bS1rK8QhKUVCF+2PHTLzKPq0HK9yRpEMfDTVdkPjWmBajC
         k6SCbK/O2HrzK80beK1zmz9dAW0QV5Cr/vTlk0/uVtf+PbxFNDg6eogy3bC0xb71WNs5
         OUyp1rx72gb9Q4m4f5+QlIEnVwYYZJ1kbkqaK55lB3DT82zg9P0x+FIqxYQbZUfY9jeI
         Kgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646388; x=1793251188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HapPLVnPKNTi6siBORLQtk0Et4KzisGv9gkCpxoyz80=;
        b=cYeIKXwcLjMBnnkjicDfoA4J4pyZAZiP0lMX/JeLp+HjIVTZY2rUQJbJwjbYGnf+yp
         m/6eeSb2q84GXt9wf83OCS/+tUe73wJBvrNRj0+5FSLMx5OP87PePrVrDQBZtOseN4wF
         Jr9yebB98w3z2sI7D0SuCfOh5xrDjF/0KmHZbWgGdY8yhwXjzwxBiA1WFoX1wOIp8rmW
         71vdGI01lOTchyXCYGg7O+7aXwgzFNmi3GZAksQ0E4PlRcZysWcxcl2gZdUZeJlghIhF
         OmTULMsM1wkATMLag/UP6LwFfPJPiiI0MEzQ92N/8RGaFr/6t/qbmn2l9C5h6u1WqmBy
         Tg+Q==
X-Gm-Message-State: AFq9FYJm576l89793TFIaiVecL8dm/xxjBnI9V4O8jLX+NkP5fHuaVQJ
	U4+RB14tavUgmZHNz8k17Gg0TMq65l7R1sRxCKjFL6U12imV0wax7BG7E9gAfZGHUjhPVOcsHKF
	0i5L1MclfoFCbhkN94K6xePyrMpy9kCrBc/TpYQy1mA==
X-Gm-Gg: AYBFou3DYcrxZknK7HJaxN7BsikgutV/DZxYPQjWG+AMmsFiWKGv6iWQ1T7VAH8dbLw
	e56nFhACloUupp7sLF5L6Su/Xoi9M7fJ4Eg7aGdBib1Sl1HiwyXQ0YplF60HH80HmSu1Ji5xNI9
	zpk86ZNH2tMTcsxrufa/Xe/DUFpiwQHrsGxMLLfepyi1iMKhg8rF0uYXITOpkyfcc2AIaKDikRY
	1m08eXYu0Sk32dz1DhKazmm/WG3dazbGWI6SPRd8jQ3KE2NvDUXApFJWC1vOJoWD1DE5973N68+
	6ejvdYjfMNB57ZcHYXAuX0JO+hK+UYSTxFjdr8DZPaySaVMcFvH/x1Cdmn+tuAcQcV9Gkz5BA+L
	MwCZ+N9kDbtBA4NqXmjDQ+sCGr3O2iVxfF6GbwzeW+Ojd0s9G2pOpQdJF4Qit80onUxqvFv5xkA
	jLiPpgBx8ru9lPR2vNBtPTH4n+zZtAic+tx5hIORf9WGitiM179yA4zp2t
X-Received: by 2002:a05:6000:2312:b0:48d:fa9c:7838 with SMTP id
 ffacd0b85a97d-48e2644efc7mr9279274f8f.2.1792646387426; Wed, 21 Oct 2026
 22:19:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 10:49:35 +0530
X-Gm-Features: AclHuK8p_QSaWeBtSoMEm3xKUDsy3StFk9vUIaP-8tnRvRCPH9rhzXhcbhlL-gk
Message-ID: <CAAhSdy1gh64bxcg_OpdWpCwHj3nb0V2Ub0AYXNeSOCnq08=o4g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221950_151753_DDF4AF6D 
X-CRM114-Status: GOOD (  20.84  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgOToyMeKAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2lj
X3B1dCgpIGNhbiBydW4gZnJvbSB0aGUgc2NoZWR1bGVyIHByZWVtcHRpb24KPiBub3RpZmllciB3
aGlsZSB0aGUgcmF3IHJ1bnF1ZXVlIGxvY2sgaXMgaGVsZC4gVGFraW5nIHZzZmlsZV9sb2NrLCBh
bgo+IHJ3bG9ja190LCB0aGVyZSB2aW9sYXRlcyB0aGUgbG9ja2RlcCB3YWl0LWNvbnRleHQgcnVs
ZXMuCj4KPiBQcm90ZWN0IHRoZSBDUFUvSEdFSSBwYWlyIHdpdGggYSBzZXBhcmF0ZSByYXcgc3Bp
bmxvY2suIEFsbCB1cGRhdGVzIHRvCj4gdGhhdCBwYWlyIHJldGFpbiB2c2ZpbGVfbG9jayBhbmQg
dGFrZSB0aGUgbmV3IGxvY2ssIHdoaWxlIHNjaGVkdWxlci1vdXQKPiB1c2VzIG9ubHkgdGhlIG5l
dyBsb2NrIGFyb3VuZCB0aGUgSEdFSUUgdXBkYXRlLiBUaGlzIGtlZXBzIHRoZSB3YWtldXAKPiBz
ZXR1cCBzZXJpYWxpemVkIHdpdGggVlMtZmlsZSBwdWJsaWNhdGlvbiBhbmQgcmVsZWFzZSB3aXRo
b3V0IGJyaW5naW5nCj4gd2lkZXIgSU1TSUMgb3BlcmF0aW9ucyBpbnRvIGEgcmF3IGNyaXRpY2Fs
IHNlY3Rpb24uCj4KPiBGaXhlczogNGNlYzg5ZGI4MGJhICgiUklTQy1WOiBLVk06IE1vdmUgSEdF
SVtFfFBdIENTUiBhY2Nlc3MgdG8gSU1TSUMgdmlydHVhbGl6YXRpb24iKQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+CgpJIGhhdmUg
cmVuYW1lZCBoZ2VpX2xvY2sgdG8gdnNmaWxlX2hnZWlfbG9jayBhdCB0aGUgdGltZSBvZiBtZXJn
aW5nLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1
ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy40CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gv
cmlzY3Yva3ZtL2FpYV9pbXNpYy5jIHwgMjUgKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9p
bXNpYy5jCj4gaW5kZXggYzFhZjIzZTc5YWUwLi4xY2NiN2VhYzlmNDUgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1z
aWMuYwo+IEBAIC00OCw2ICs0OCw4IEBAIHN0cnVjdCBpbXNpYyB7Cj4KPiAgICAgICAgIC8qIElN
U0lDIFZTLWZpbGUgKi8KPiAgICAgICAgIHJ3bG9ja190IHZzZmlsZV9sb2NrOwo+ICsgICAgICAg
LyogV3JpdGVycyBob2xkIGJvdGggbG9ja3M7IHNjaGVkdWxlci1vdXQgb25seSB0YWtlcyBoZ2Vp
X2xvY2suICovCj4gKyAgICAgICByYXdfc3BpbmxvY2tfdCBoZ2VpX2xvY2s7Cj4gICAgICAgICBp
bnQgdnNmaWxlX2NwdTsKPiAgICAgICAgIGludCB2c2ZpbGVfaGdlaTsKPiAgICAgICAgIHZvaWQg
X19pb21lbSAqdnNmaWxlX3ZhOwo+IEBAIC01ODIsNiArNTg0LDE3IEBAIHN0YXRpYyB2b2lkIGlt
c2ljX3ZzZmlsZV9sb2NhbF91cGRhdGUoaW50IHZzZmlsZV9oZ2VpLCB1MzIgbnJfZWl4LAo+ICAg
ICAgICAgY3NyX3dyaXRlKENTUl9WU0lTRUxFQ1QsIG9sZF92c2lzZWxlY3QpOwo+ICB9Cj4KPiAr
c3RhdGljIHZvaWQgaW1zaWNfdnNmaWxlX3NldF9oZ2VpKHN0cnVjdCBpbXNpYyAqaW1zaWMsIGlu
dCBjcHUsIGludCBoZ2VpKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICsK
PiArICAgICAgIC8qIFNlcmlhbGl6ZSB0aGUgQ1BVL0hHRUkgcGFpciB3aXRoIHNjaGVkdWxlci1v
dXQncyB3YWtldXAgc2V0dXAuICovCj4gKyAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmlt
c2ljLT5oZ2VpX2xvY2ssIGZsYWdzKTsKPiArICAgICAgIGltc2ljLT52c2ZpbGVfY3B1ID0gY3B1
Owo+ICsgICAgICAgaW1zaWMtPnZzZmlsZV9oZ2VpID0gaGdlaTsKPiArICAgICAgIHJhd19zcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZpbXNpYy0+aGdlaV9sb2NrLCBmbGFncyk7Cj4gK30KPiArCj4g
IHN0YXRpYyB2b2lkIGltc2ljX3ZzZmlsZV9jbGVhbnVwKHN0cnVjdCBpbXNpYyAqaW1zaWMpCj4g
IHsKPiAgICAgICAgIGludCBvbGRfdnNmaWxlX2hnZWksIG9sZF92c2ZpbGVfY3B1Owo+IEBAIC01
OTYsNyArNjA5LDcgQEAgc3RhdGljIHZvaWQgaW1zaWNfdnNmaWxlX2NsZWFudXAoc3RydWN0IGlt
c2ljICppbXNpYykKPiAgICAgICAgIHdyaXRlX2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9s
b2NrLCBmbGFncyk7Cj4gICAgICAgICBvbGRfdnNmaWxlX2hnZWkgPSBpbXNpYy0+dnNmaWxlX2hn
ZWk7Cj4gICAgICAgICBvbGRfdnNmaWxlX2NwdSA9IGltc2ljLT52c2ZpbGVfY3B1Owo+IC0gICAg
ICAgaW1zaWMtPnZzZmlsZV9jcHUgPSBpbXNpYy0+dnNmaWxlX2hnZWkgPSAtMTsKPiArICAgICAg
IGltc2ljX3ZzZmlsZV9zZXRfaGdlaShpbXNpYywgLTEsIC0xKTsKPiAgICAgICAgIGltc2ljLT52
c2ZpbGVfdmEgPSBOVUxMOwo+ICAgICAgICAgaW1zaWMtPnZzZmlsZV9wYSA9IDA7Cj4gICAgICAg
ICB3cml0ZV91bmxvY2tfaXJxcmVzdG9yZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4g
QEAgLTcyNywxMCArNzQwLDEwIEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3B1dChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICBpZiAoIWt2bV92Y3B1X2lzX2Jsb2NraW5n
KHZjcHUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAtICAgICAgIHJlYWRfbG9ja19p
cnFzYXZlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiArICAgICAgIHJhd19zcGluX2xv
Y2tfaXJxc2F2ZSgmaW1zaWMtPmhnZWlfbG9jaywgZmxhZ3MpOwo+ICAgICAgICAgaWYgKGltc2lj
LT52c2ZpbGVfY3B1ID4gLTEpCj4gICAgICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX0hHRUlFLCBC
SVQoaW1zaWMtPnZzZmlsZV9oZ2VpKSk7Cj4gLSAgICAgICByZWFkX3VubG9ja19pcnFyZXN0b3Jl
KCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiArICAgICAgIHJhd19zcGluX3VubG9ja19p
cnFyZXN0b3JlKCZpbXNpYy0+aGdlaV9sb2NrLCBmbGFncyk7Cj4gIH0KPgo+ICB2b2lkIGt2bV9y
aXNjdl92Y3B1X2FpYV9pbXNpY19yZWxlYXNlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiBAQCAt
NzQ3LDcgKzc2MCw3IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3JlbGVhc2Uoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgd3JpdGVfbG9ja19pcnFzYXZlKCZpbXNpYy0+
dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiAgICAgICAgIG9sZF92c2ZpbGVfaGdlaSA9IGltc2ljLT52
c2ZpbGVfaGdlaTsKPiAgICAgICAgIG9sZF92c2ZpbGVfY3B1ID0gaW1zaWMtPnZzZmlsZV9jcHU7
Cj4gLSAgICAgICBpbXNpYy0+dnNmaWxlX2NwdSA9IGltc2ljLT52c2ZpbGVfaGdlaSA9IC0xOwo+
ICsgICAgICAgaW1zaWNfdnNmaWxlX3NldF9oZ2VpKGltc2ljLCAtMSwgLTEpOwo+ICAgICAgICAg
aW1zaWMtPnZzZmlsZV92YSA9IE5VTEw7Cj4gICAgICAgICBpbXNpYy0+dnNmaWxlX3BhID0gMDsK
PiAgICAgICAgIHdyaXRlX3VubG9ja19pcnFyZXN0b3JlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZs
YWdzKTsKPiBAQCAtODYxLDggKzg3NCw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNf
dXBkYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAgLyogVXBkYXRlIG5ldyBJ
TVNJQyBWUy1maWxlIGRldGFpbHMgaW4gSU1TSUMgY29udGV4dCAqLwo+ICAgICAgICAgd3JpdGVf
bG9ja19pcnFzYXZlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiAtICAgICAgIGltc2lj
LT52c2ZpbGVfaGdlaSA9IG5ld192c2ZpbGVfaGdlaTsKPiAtICAgICAgIGltc2ljLT52c2ZpbGVf
Y3B1ID0gdmNwdS0+Y3B1Owo+ICsgICAgICAgaW1zaWNfdnNmaWxlX3NldF9oZ2VpKGltc2ljLCB2
Y3B1LT5jcHUsIG5ld192c2ZpbGVfaGdlaSk7Cj4gICAgICAgICBpbXNpYy0+dnNmaWxlX3ZhID0g
bmV3X3ZzZmlsZV92YTsKPiAgICAgICAgIGltc2ljLT52c2ZpbGVfcGEgPSBuZXdfdnNmaWxlX3Bh
Owo+ICAgICAgICAgd3JpdGVfdW5sb2NrX2lycXJlc3RvcmUoJmltc2ljLT52c2ZpbGVfbG9jaywg
ZmxhZ3MpOwo+IEBAIC0xMTEyLDYgKzExMjQsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2lt
c2ljX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgLyogU2V0dXAgSU1TSUMg
Y29udGV4dCAgKi8KPiAgICAgICAgIGltc2ljLT5ucl9tc2lzID0ga3ZtLT5hcmNoLmFpYS5ucl9p
ZHMgKyAxOwo+ICAgICAgICAgcndsb2NrX2luaXQoJmltc2ljLT52c2ZpbGVfbG9jayk7Cj4gKyAg
ICAgICByYXdfc3Bpbl9sb2NrX2luaXQoJmltc2ljLT5oZ2VpX2xvY2spOwo+ICAgICAgICAgaW1z
aWMtPm5yX2VpeCA9IEJJVFNfVE9fVTY0KGltc2ljLT5ucl9tc2lzKTsKPiAgICAgICAgIGltc2lj
LT5ucl9od19laXggPSBCSVRTX1RPX1U2NChrdm1fcmlzY3ZfYWlhX21heF9pZHMpOwo+ICAgICAg
ICAgaW1zaWMtPnZzZmlsZV9oZ2VpID0gaW1zaWMtPnZzZmlsZV9jcHUgPSAtMTsKPiAtLQo+IDIu
NDMuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
