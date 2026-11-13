Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB3B606A321
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QyRqkqUA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=eQMz6Vq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jwHmwjv+cvY8ofwGIyBJcmydjynQZG5dpjGynG/1yvg=; b=QyRqkqUAmMdBH9b+oYQtxYPglb
	OzGsw/56YmkIMJrIzSBDXMsRMfpjb040Q7HfHxxg5HBYJeuSrEvQBcsNG3sVG/tnowr8LiUbNDLeU
	S8OyiSOqGSZaBmkC+OtyvwVpaYSEm/CmkMk+A+8mo+5ucVQEM2pXbnfTErr5ZfHjUIBO+Ee7fItl+
	Rw85vqs+eS25+cNv5qyCFDyej7+74PnF5K2qHzKps1EopN9OYSSrwVVA/6LRCWtZjsrLV3gQGySxN
	phdEgOEfJgLwg1lLDe1ChYtPbb5X2OqT/kmKgMrNnLnLcm2Xms7vAO1pT9vd12SRGRJ4Oc+oI2xvC
	SpUXP9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqDK-0000000CgjE-3Xbv;
	Fri, 13 Nov 2026 12:17:06 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqD0-0000000Cge4-3YeC
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 12:17:04 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so1870822a12.2
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Nov 2026 04:16:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572205; cv=none;
        d=google.com; s=arc-20260327;
        b=LYWK3Cra4h1MdhePtu9adGlyN0VK0bRJ/czFlqgyNMeStSNn9r6NxzyHCexMKLyays
         Bialj4sH1g/RmVa0HqWCEu7DAoNrrP5V4skUbxEXELW20oBphKhMzssGwun3dEy5XHnj
         DNNLnruL+VeJvglMcVMzuyo0uDhrIbzDFV1azu/Dd2797JPepTJoj4tQt1NGK4M0Ce5X
         HoFuLOlV6xB+zJL/aOaCEZ66ZHY7Bqs2w0TdUxdgRFKblPpFaqAktTbQs2+y0dSJwjY9
         8xzi+7Ui2XOKm5ZCtMxt0lB6p/Da7VVOgtXrTa1jF02Gjfmpe39fkGc1J57gtj1YOphU
         wYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yh//LwFAWkhuSX27zp/CKGjXWFK/r7pkuQ5AkJ8bS8k=;
        fh=iynQljl9+osCx3kZA33ND0jQ0Zr0M4BRnB6YjWAkB3M=;
        b=awp9LrTWuvAA9qj4uJXRMi1Z8EiFY+KbWpPuwTuJqxivdD6K963ZrJ6AYj/VvT+Vlj
         ZwfE56cGYJEOdmoH3gnzhdYwnf1p83u6R4p1EZ/ZesTJ9qzh6zwcvgzGmQXuelCrovSa
         px4WVsPRvQGZOtztrkMa7c8hYQb9yiJJc4wtMSqZTBU54qLD2CCgOFsBUfhhmK1t5EjR
         4WRsHYEFe1zdeWN9I0QLYkoHyGVQeG0HgWN4ygyR1Bu9YsA5LRrzi8nxUoOPKvB0KzDr
         WgHkdaaheQ54ZdrPUPIBlduuZz4w9HV7AJBdl3ss63Tqcdgm1/M+Yrwzm0wUgQIibD69
         Ggjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794572205; x=1795177005; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yh//LwFAWkhuSX27zp/CKGjXWFK/r7pkuQ5AkJ8bS8k=;
        b=eQMz6Vq0gURuppVTYkttznHtRzNen37wdu19lR8JYgX1T0Axmoxq/pLSX4k6+WWc0r
         Au6eMiMrhxatFYc2Y5KOc6Q7NCjEvNwzscdlBkKZViytajjgnE1CS+x6dQ8mKolo8V0y
         VXfPszbKJFLfe46zHuYJ9Uj47LyQaD977uI184UOGPOCF6A1LkzyUBs5U4CUAYMGzAY3
         hK2Lu1QODdeU0LHH51kK+sau5nVcA9xkHKWmuzVjqCOSyg+NgkYsBrqqmbdZH6e6rzsm
         x9JJZU7/9LlxcNrmDB9TGRUH2pHkyMi5PRaLYlXB3V7QT8tuuCu0m/PH9CbknMcC9zld
         184w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572205; x=1795177005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yh//LwFAWkhuSX27zp/CKGjXWFK/r7pkuQ5AkJ8bS8k=;
        b=Xzr6R/AP1cxf/hMzUT2ATlbU2L1b7eEopH57GBsP6C+Wy2LL+KM/ByBlRDm5ZVEjyQ
         iAZySYcJOEZPyjx29iVw2c03NGwSu96aEr3t84GXV8YOAHHSrZdkmEZtspxNGNUVQST/
         9Fvec2OHic3Trb2ZVXa2Cm1Rl3jzgTipKQAGw+/vjxr0zn9CxGAm6YhONeNGX1IvOYNB
         2lqXKED2FK7sz4jGcdAC/RVD3+QciUFA/T1Y0k7eG+V+zUQwatLV7K2kRRr/FJjea6jP
         NpiqbML9yOglh5SYjVEqntnT4R82LX6bKSST5NuhmovzmSyw0zQCm8GnLm/Ye+XzJdPC
         WlEQ==
X-Forwarded-Encrypted: i=1; AL+hErGQzbG0m7Du9ronCpymyQmCpiOW192f36/OfJk6wV4yqrJuFP2Z1DZl8Sy1xz9YiwbqrUhsPSWsjbY=@lists.infradead.org
X-Gm-Message-State: APuU4Z8j2W+8l5zSPBMrPv7is+b8IsMQlne0yLAJUSGlj9AHXitbnoGZ
	HshcKRy9kPFc67JV2IYraImcVlmWGpY+/kD7MULISJxIRTTjwPhGjrymHDEPEC6BUjqI4Sg2j0h
	mimUwVjNAqPOgpW8XSAIunWyNRaT5o4d7xK2UCEPZT+kCSO6iTWzp
X-Gm-Gg: AYBFou16CWd1uFHXWY6wJtVRAi2TrIAsLOtcW1RgKiXvZoRrfwcTunoBrLKjYaJynMK
	NCT5H5Y5BL27qS4SqC7bSLU70Ph+J2QjmkLs0wpHh9+iAkD9VSl3AQ5kSM7sMOR1Bnd+bk+j3kS
	Ps+YkcfZmQXi7qh/FsdC5hOuavKkNLBbSLmpZ3LgFaeF9INsxUdHOqdq83xU4IMTpkijXiuTXgR
	v0DdbVO0X33dCS2x1Pfolf7wyiiKA2bziRJoVztl0kiNINybw8FdjYl6oVvg9aUnrYkdtt53PJm
	Y3Yonm3naIBiMjpQxukGaG5e+X3+IsLcx7l1+ZoGZ6xVm6ZHe9QcrZtYVJHsrnxdVRbQkPvR6a7
	480TDQxHoORSUHyOKhIY8uMunf/h1Wg2WuDl0B26P0S3RD/zP368YNFuJlGtdcH+/g3DMYO+h7J
	oUFvpGv3qFo+SQ8uvJk2EvurHHf0jbe4pMBlPHwWw9yTH7VTndNS+pB5yrROSP9rYqoUg2DHl2Q
	Kze
X-Received: by 2002:a05:6402:5177:b0:6b6:fddc:dbc1 with SMTP id
 4fb4d7f45d1cf-6b7c08b08admr1438436a12.6.1794572204712; Fri, 13 Nov 2026
 04:16:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <tencent_C8B170AF63DC42F81A47F9EA044BB4B11C09@qq.com>
In-Reply-To: <tencent_C8B170AF63DC42F81A47F9EA044BB4B11C09@qq.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 17:46:32 +0530
X-Gm-Features: AclHuK-Kyzf_3Aa78LNIir_Q7TGPINiFuQF__Q3gkCjYhZcKlm3MtE70aN1T8Lg
Message-ID: <CAAhSdy3K1AFB-DWKznNru+x2hNiP5_M+uTZEZBHWwdvLfJrNQA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix G-stage page table memory leak on VM destroy
To: Yangyu Chen <cyy@cyyself.name>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_041654_183056_B45A6E5F 
X-CRM114-Status: GOOD (  38.59  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBPY3QgMzEsIDIwMjYgYXQgMTI6MjjigK9BTSBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNl
bGYubmFtZT4gd3JvdGU6Cj4KPiBrdm1fcmlzY3ZfbW11X2ZyZWVfcGdkKCkgdGVhcnMgZG93biB0
aGUgRy1zdGFnZSB3aXRoCj4ga3ZtX3Jpc2N2X2dzdGFnZV91bm1hcF9yYW5nZSgpIG92ZXIgdGhl
IHdob2xlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MKPiBzcGFjZS4gVGhhdCBmdW5jdGlvbiBsb29r
cyB1cCBlYWNoIGFkZHJlc3Mgd2l0aAo+IGt2bV9yaXNjdl9nc3RhZ2VfZ2V0X2xlYWYoKSwgd2hp
Y2ggd2Fsa3MgZG93biB0byB0aGUgbGVhZiBQVEUsIGFuZCB0aGVuCj4gY2xlYXJzIG9ubHkgdGhh
dCBsZWFmLiBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZSgpIGZyZWVzIGEgcGFnZSB0YWJsZSBvbmx5
Cj4gd2hlbiBpdCBpcyBjYWxsZWQgb24gYSBub24tbGVhZiBQVEUsIHdoaWNoIG5ldmVyIGhhcHBl
bnMgaGVyZSwgc28gZXZlcnkKPiBwYWdlIHRhYmxlIGJlbG93IHRoZSBQR0QgaXMgbGVha2VkIHdo
ZW4gYSBWTSBpcyBkZXN0cm95ZWQuIFdpdGggNCBLaUIKPiBtYXBwaW5ncyB0aGlzIGlzIG9uZSBw
YWdlIHBlciAyIE1pQiBvZiBndWVzdCBtZW1vcnkgdGhhdCB3YXMgZXZlcgo+IG1hcHBlZCwgcGx1
cyB0aGUgdXBwZXItbGV2ZWwgdGFibGVzLgo+Cj4gVGhlIGxlYWtlZCBwYWdlcyBhcmUgbm90IHNs
YWIsIHZtYWxsb2Mgb3IgcGFnZSBjYWNoZSwgc28gdGhleSBzaG93IHVwCj4gb25seSBhcyB1bmFj
Y291bnRlZCB1c2VkIG1lbW9yeS4gT24gYSBTcGFjZW1pVCBLMyBob3N0LCBhIHdvcmtsb2FkIHRo
YXQKPiBjcmVhdGVzIGFuZCBkZXN0cm95cyB0ZW5zIG9mIHRob3VzYW5kcyBvZiBzbWFsbCBWTXMg
bGVha2VkIDAuNS0xIE1pQiBwZXIKPiBWTSBhbmQgcmFuIHRoZSBob3N0IG91dCBvZiBtZW1vcnkg
YWZ0ZXIgYWJvdXQgMjAsMDAwIFZNcy4KPgo+IEFkZCBrdm1fcmlzY3ZfZ3N0YWdlX3VubWFwX2Fs
bCgpLCB3aGljaCBjYWxscyBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZSgpCj4gd2l0aCBHU1RBR0Vf
T1BfQ0xFQVIgb24gZXZlcnkgUEdEIGVudHJ5LiBUaGF0IHJlY3Vyc2l2ZWx5IGNsZWFycyBhbGwK
PiBsZWFmIFBURXMgYW5kIGZyZWVzIGVhY2ggcGFnZSB0YWJsZSBiZWxvdyB0aGUgUEdELiBVc2Ug
aXQgaW4KPiBrdm1fcmlzY3ZfbW11X2ZyZWVfcGdkKCkuCj4KPiBUZXN0ZWQgd2l0aCBhIHJlcHJv
ZHVjZXIgc2NyaXB0IHRoYXQgYnVpbGRzIGEgbWluaW1hbCBLVk0gaG9zdCBrZXJuZWwKPiBmcm9t
IGEgc291cmNlIHRyZWUgYW5kIGJvb3RzIGl0IHVuZGVyIFFFTVUgMTEuMC4yIChUQ0csIHJ2NjQg
d2l0aCBILAo+IFN2NTd4NCBHLXN0YWdlKS4gSXRzIGluaXQgY3JlYXRlcyAxMCBWTXMgb25lIGFm
dGVyIGFub3RoZXIuIEVhY2ggZ3Vlc3QKPiB3cml0ZXMgb25lIHdvcmQgaW4gZXZlcnkgMiBNaUIg
b2YgYW4gOCBHaUIgUkFNIHJlZ2lvbiAoYW5vbnltb3VzIG1lbW9yeQo+IHdpdGggTUFEVl9OT0hV
R0VQQUdFLCBzbyA0IEtpQiBHLXN0YWdlIG1hcHBpbmdzKSBhbmQgdGhlbiBzaHV0cyBkb3duLAo+
IHNvIGVhY2ggVk0gbmVlZHMgNDA5NiBsYXN0LWxldmVsIHBhZ2UgdGFibGVzICgxNiBNaUIpLiBN
ZW1GcmVlIGxvc3QgcGVyCj4gVk0sIGFmdGVyIG9uZSB3YXJtLXVwIFZNOgo+Cj4gICBiZWZvcmU6
ICAxNjQxNSBrQiAgKFJFU1VMVDogTEVBSykKPiAgIGFmdGVyOiAgICAxNjM2IGtCICAoUkVTVUxU
OiBPSywgbm9pc2UpCj4KPiBUaGUgYnVnIHdhcyBmb3VuZCB3aGlsZSBpbnZlc3RpZ2F0aW5nIHRo
ZSBob3N0IE9PTSwgYW5kIHRoZSBmaXggYW5kCj4gcmVwcm9kdWNlciB3ZXJlIHdyaXR0ZW4gd2l0
aCB0aGUgaGVscCBvZiBhbiBBSSBjb2RpbmcgYXNzaXN0YW50Cj4gKENsYXVkZSkuIFRoZSBhbmFs
eXNpcywgZml4IGFuZCB0ZXN0IHJlc3VsdHMgYWJvdmUgd2VyZSByZXZpZXdlZCBieQo+IHRoZSBz
dWJtaXR0ZXIuCj4KPiBGaXhlczogOWQwNWMxZmVlODM3ICgiUklTQy1WOiBLVk06IEltcGxlbWVu
dCBzdGFnZTIgcGFnZSB0YWJsZSBwcm9ncmFtbWluZyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYubmFtZT4KCkdv
b2QgY2F0Y2guIFRoYW5rcyBmb3IgdGhlIGZpeC4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIExpbnV4
LTcuNC1yY1gKClRoYW5rcywKQW51cAoKPiAtLS0KPiBIb3cgdG8gcmVwcm9kdWNlOgo+Cj4gVGhl
IHJlcHJvZHVjZXIgc2NyaXB0IGlzIGF0Cj4gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vY3l5c2Vs
Zi8yM2FiYjg3YThhZDllZThjNjRjZTAzY2NhNzg2NjlmYwo+IGFuZCBuZWVkcyByaXNjdjY0LWxp
bnV4LWdudS1nY2MsIHFlbXUtc3lzdGVtLXJpc2N2NjQgYW5kIGNwaW8uIFJ1biBpdAo+IGZyb20g
dGhlIHRvcCBvZiBhIGtlcm5lbCBzb3VyY2UgdHJlZToKPgo+ICAgICAgICAgJCBjZCBsaW51eAo+
ICAgICAgICAgJCAvcGF0aC90by9rdm0tcmlzY3YtZ3N0YWdlLWxlYWsuc2gKPgo+IEl0IGJ1aWxk
cyBhIG1pbmltYWwgcmlzY3Y2NCBLVk0gaG9zdCBrZXJuZWwgKGFsbG5vY29uZmlnICsgS1ZNKSBp
bnRvCj4gLmt2bS1sZWFrLWJ1aWxkLyBhbmQgYm9vdHMgaXQgdW5kZXIgUUVNVSAoVENHLCAtY3B1
IHJ2NjQsaD10cnVlKSB3aXRoIGEKPiBzdGF0aWMgdGVzdCBwcm9ncmFtIGFzIC9pbml0LiBUaGUg
dGVzdCBjcmVhdGVzIDEwIFZNcyBvbmUgYWZ0ZXIgYW5vdGhlci4KPiBFYWNoIGd1ZXN0IHRvdWNo
ZXMgb25lIHBhZ2UgaW4gZXZlcnkgMiBNaUIgb2YgOCBHaUIgb2YgZ3Vlc3QgUkFNLCBzbyBpdAo+
IG5lZWRzIDE2IE1pQiBvZiBsYXN0LWxldmVsIEctc3RhZ2UgcGFnZSB0YWJsZXMuIFRoZSB0ZXN0
IHRoZW4gcHJpbnRzIGhvdwo+IG11Y2ggTWVtRnJlZSBlYWNoIFZNIGxlYXZlcyBiZWhpbmQuIFRo
ZSBmaXJzdCBydW4gdGFrZXMgYWJvdXQgMS41Cj4gbWludXRlcywgbW9zdGx5IGtlcm5lbCBidWls
ZDsgcmVydW5zIHRha2UgYWJvdXQgMTAgc2Vjb25kcy4KPgo+IFdpdGhvdXQgdGhpcyBwYXRjaDoK
Pgo+ICAgICAgICAgMTAgVk1zLCBlYWNoIHRvdWNoaW5nIG9uZSA0IEtpQiBwYWdlIHBlciAyIE1p
QiBvZiA4IEdpQiBndWVzdCBSQU0KPiAgICAgICAgIE1lbUZyZWUgMjAzNzY2NCAtPiAxODczNTEy
IGtCOiAxNjQxNSBrQiBsb3N0IHBlciBWTSAoYSBsZWFraW5nIGtlcm5lbCBsb3NlcyB+MTYzODQg
a0IpCj4gICAgICAgICBSRVNVTFQ6IExFQUsKPgo+IFdpdGggdGhpcyBwYXRjaDoKPgo+ICAgICAg
ICAgTWVtRnJlZSAyMDU0MDgwIC0+IDIwMzc3MTYga0I6IDE2MzYga0IgbG9zdCBwZXIgVk0gKGEg
bGVha2luZyBrZXJuZWwgbG9zZXMgfjE2Mzg0IGtCKQo+ICAgICAgICAgUkVTVUxUOiBPSwo+Cj4g
VGhlIGV4aXQgc3RhdHVzIGlzIDAgZm9yIE9LLCAxIGZvciBMRUFLIGFuZCAyIGlmIHRoZSB0ZXN0
IGNvdWxkIG5vdAo+IHJ1bi4gSU1BR0U9PHBhdGgvdG8vSW1hZ2U+IGJvb3RzIGFuIGV4aXN0aW5n
IGtlcm5lbCBpbnN0ZWFkIG9mIGJ1aWxkaW5nCj4gb25lLiBUaGF0IGtlcm5lbCBuZWVkcyBDT05G
SUdfS1ZNPXksIENPTkZJR19CTEtfREVWX0lOSVRSRD15IGFuZAo+IENPTkZJR19ERVZUTVBGUz15
Lgo+Cj4gSSBhbHNvIHRlc3RlZCBWTXMgdGhhdCBzZWxlY3QgU3YzOXg0LCBTdjQ4eDQgYW5kIFN2
NTd4NCB0aHJvdWdoCj4gS1ZNX0NBUF9WTV9HUEFfQklUUywgYW5kIGZvdXIgVk1zIHdpdGggbWl4
ZWQgbW9kZXMgYWxpdmUgYXQgdGhlIHNhbWUKPiB0aW1lLCBkZXN0cm95ZWQgb25lIGJ5IG9uZSB3
aGlsZSB0aGUgcmVtYWluaW5nIFZNcyBrZXB0IHJ1bm5pbmcgYW5kCj4gd2VyZSBjaGVja2VkIGZv
ciBjb3JyZWN0IGd1ZXN0IG1lbW9yeSBjb250ZW50cy4gV2l0aCB0aGlzIHBhdGNoLCBubwo+IG1l
bW9yeSB3YXMgbG9zdCBpbiBhbnkgbW9kZSBhbmQgbm8gZ3Vlc3QgZGF0YSB3YXMgY29ycnVwdGVk
LiBXaXRob3V0Cj4gaXQsIGV2ZXJ5IG1vZGUgbGVha2VkIGFib3V0IDE2IE1pQiBwZXIgVk0uCj4g
LS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIHwgIDIgKysKPiAgYXJj
aC9yaXNjdi9rdm0vZ3N0YWdlLmMgICAgICAgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysr
KysrCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgICAgICAgICAgICAgIHwgIDMgKy0tCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gaW5kZXggYWFmMDgwYmExYjc3Li45MGVjOWUwYjM0
YjEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaAo+IEBAIC04MCw2ICs4MCw4
IEBAIGJvb2wga3ZtX3Jpc2N2X2dzdGFnZV9vcF9wdGUoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFn
ZSwgZ3BhX3QgYWRkciwKPiAgYm9vbCBrdm1fcmlzY3ZfZ3N0YWdlX3VubWFwX3JhbmdlKHN0cnVj
dCBrdm1fZ3N0YWdlICpnc3RhZ2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdwYV90IHN0YXJ0LCBncGFfdCBzaXplLCBib29sIG1heV9ibG9jayk7Cj4KPiArYm9vbCBrdm1f
cmlzY3ZfZ3N0YWdlX3VubWFwX2FsbChzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlKTsKPiArCj4g
IGJvb2wga3ZtX3Jpc2N2X2dzdGFnZV93cF9yYW5nZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdl
LCBncGFfdCBzdGFydCwgZ3BhX3QgZW5kKTsKPgo+ICBib29sIGt2bV9yaXNjdl9nc3RhZ2Vfd3Bf
cHRfbWFza2VkKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsIGdmbl90IGJhc2VfZ2ZuLAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFn
ZS5jCj4gaW5kZXggZTUwMDJjYjljYmVmLi5jOTEyY2RjMjAyMWYgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBA
IC00NTYsNiArNDU2LDI4IEBAIGJvb2wga3ZtX3Jpc2N2X2dzdGFnZV91bm1hcF9yYW5nZShzdHJ1
Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLAo+ICAgICAgICAgcmV0dXJuIGZsdXNoOwo+ICB9Cj4KPiAr
LyoKPiArICogQ2xlYXIgZXZlcnkgRy1zdGFnZSBtYXBwaW5nIGFuZCBmcmVlIGFsbCBwYWdlIHRh
YmxlcyBiZWxvdyB0aGUgUEdELgo+ICsgKiBrdm1fcmlzY3ZfZ3N0YWdlX3VubWFwX3JhbmdlKCkg
b25seSBjbGVhcnMgbGVhZiBQVEVzIGFuZCBsZWF2ZXMgdGhlCj4gKyAqIHBhZ2UgdGFibGVzIGlu
IHBsYWNlLCBzbyBpdCBjYW5ub3QgYmUgdXNlZCB0byB0ZWFyIGRvd24gYSBHLXN0YWdlLgo+ICsg
Ki8KPiArYm9vbCBrdm1fcmlzY3ZfZ3N0YWdlX3VubWFwX2FsbChzdHJ1Y3Qga3ZtX2dzdGFnZSAq
Z3N0YWdlKQo+ICt7Cj4gKyAgICAgICB1MzIgbGV2ZWwgPSBnc3RhZ2UtPnBnZF9sZXZlbHMgLSAx
Owo+ICsgICAgICAgcHRlX3QgKnBnZCA9IChwdGVfdCAqKWdzdGFnZS0+cGdkOwo+ICsgICAgICAg
dW5zaWduZWQgbG9uZyBpLCBwYWdlX3NpemU7Cj4gKyAgICAgICBib29sIGZsdXNoID0gZmFsc2U7
Cj4gKwo+ICsgICAgICAgaWYgKGdzdGFnZV9sZXZlbF90b19wYWdlX3NpemUoZ3N0YWdlLCBsZXZl
bCwgJnBhZ2Vfc2l6ZSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gKyAg
ICAgICBmb3IgKGkgPSAwOyBpIDwga3ZtX3Jpc2N2X2dzdGFnZV9wZ2Rfc2l6ZSAvIHNpemVvZihw
dGVfdCk7IGkrKykKPiArICAgICAgICAgICAgICAgZmx1c2ggfD0ga3ZtX3Jpc2N2X2dzdGFnZV9v
cF9wdGUoZ3N0YWdlLCBpICogcGFnZV9zaXplLCAmcGdkW2ldLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZXZlbCwgR1NUQUdFX09QX0NMRUFSKTsK
PiArCj4gKyAgICAgICByZXR1cm4gZmx1c2g7Cj4gK30KPiArCj4gIGJvb2wga3ZtX3Jpc2N2X2dz
dGFnZV93cF9yYW5nZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLCBncGFfdCBzdGFydCwgZ3Bh
X3QgZW5kKQo+ICB7Cj4gICAgICAgICBpbnQgcmV0Owo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMzcxZmNjYWY5ZGYwLi44
NzgzOGEwZjZiYjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9h
cmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC03ODQsOCArNzg0LDcgQEAgdm9pZCBrdm1fcmlzY3Zf
bW11X2ZyZWVfcGdkKHN0cnVjdCBrdm0gKmt2bSkKPiAgICAgICAgIHdyaXRlX2xvY2soJmt2bS0+
bW11X2xvY2spOwo+ICAgICAgICAgaWYgKGt2bS0+YXJjaC5wZ2QpIHsKPiAgICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X2dzdGFnZV9pbml0KCZnc3RhZ2UsIGt2bSk7Cj4gLSAgICAgICAgICAgICAg
IGZsdXNoID0ga3ZtX3Jpc2N2X2dzdGFnZV91bm1hcF9yYW5nZSgmZ3N0YWdlLCAwVUwsCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9ncGFfc2l6ZShrdm0tPmFyY2gu
cGdkX2xldmVscyksIGZhbHNlKTsKPiArICAgICAgICAgICAgICAgZmx1c2ggPSBrdm1fcmlzY3Zf
Z3N0YWdlX3VubWFwX2FsbCgmZ3N0YWdlKTsKPiAgICAgICAgICAgICAgICAgcGdkID0gUkVBRF9P
TkNFKGt2bS0+YXJjaC5wZ2QpOwo+ICAgICAgICAgICAgICAgICBrdm0tPmFyY2gucGdkID0gTlVM
TDsKPiAgICAgICAgICAgICAgICAga3ZtLT5hcmNoLnBnZF9waHlzID0gMDsKPiAtLQo+IDIuNTMu
MAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
