Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC21B606A32E
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 05:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ut/EEFUk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=tOs10C3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6nptqr8OgXn+67DpfcgslxtXWZCi1IbMSEsFsc8CEA4=; b=ut/EEFUkdNocH4m/qTciJ0DNjp
	uwMUx/1ZU2jHhxKWv4FVjQkzr+0OPfCVwVlcyhnUJGNCsoKkIYL2p4wBuo56PeFk4AlviGCM4IVtk
	ZXKtONKNDaWdZbujJYo5qboIFYkj4YAbFtOqTqoFj5d/hyawYwAv9Mi9jLW8J+TBwDtoYSTtC0Tf6
	IPMS8t0VCb+EdvU7ecn1TtlcR9DXGKBsgPNLXS9G1BTARHx85MNVJw7pJ+LGpoS1BcFB8tiiKoOfB
	WE94sxcmtxG0/9MrssNnGhdHsFqsQzdHL/GXynqMwFaWN6v2kMyKFleHN4oa5u+/04V5dF1gjK/Iy
	hcG3JpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjxU-0000000Bhf0-2JUp;
	Fri, 13 Nov 2026 05:36:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjxR-0000000Bhdj-0TXo
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 05:36:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso8868765e9.1
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Nov 2026 21:36:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794548175; cv=none;
        d=google.com; s=arc-20260327;
        b=c4YMokzUo47yS/8vGI8/hxbXTuQWah+dI64H7g+yCFzh2IR+VjaCyJdbVgRQ8uR976
         Bw25x4mrOvroIrA7sTBwZY7XDrFtEarCImoIy7F9FOtM2pagOgODintmRYxuDKiOog2p
         3cBnwsKPNht8sfLI2w1m7+kP7leY44hpvJwzGoz/I0JBiS/MQWCZt2OGhPGitqj4MDeS
         csB0skoQmas4J1uA3ReL9eCw9bCtg8huaLm7Z1YKHFEEizEeCDWv+rxjxubIqZ0bcA3Y
         kJDOijHajYs/juBQYs7yeXHZMJ5i9dpiuOY5NNOwmKzjoTgmFYTsvHnyYLe4t/R3279q
         xyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Asn5k3wB77QNm+ii4GqJgfJg46vBWMInhGMAcW/l5U0=;
        fh=VV3+f9GOTPxl18GeD0HpULEEh4wTV1+v1VL09hQVdYE=;
        b=pax9I7Oret6AOsPGDlouZFUP1epUPc2C1v+3S5Az1NfVNYRrAKwXqMXgRIKRX82VyK
         mt0msqET9GIIyYvX9uyRpEeBQpbEMVHMfEybx+XHAtd/v2XnCIVKrjlvDjmiToC58rJo
         TRJA5+sCiMGy1mYm67sOnzRfBd/PbI9afCSXunYrtXsME1PgK0v2jlPJ0MwFaZviEkK/
         fHmwx/5XBbWWWjFooe3lwPnIaAKXZlCOSMbtqBVJipchQY9vRTJyIzQm9bPNZzWtMEhS
         NpZ5xA/+UM/aDMBcMpjhHDrYKIdOzY0sTQkT2eaiHK1Ev8Nrsl084Hxqi1AKUyCF5RKg
         fR4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794548175; x=1795152975; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Asn5k3wB77QNm+ii4GqJgfJg46vBWMInhGMAcW/l5U0=;
        b=tOs10C3z7dVfAnsm84zX60kGRsWtycZDlMyexBKICdktYBiOuBwr7wHjJOzSoRB9Re
         ahdcwYbEUeuhUe7ZIS6FJUliVuWWZHSZpA4pJlboGy4qxwsnx8oDgW9Lck9x4OY1mtCJ
         4Xt4HHReujtgCMgka0qjspibrLkbK1X/3W8txwmuyQOI6sCGv0NqXa0QtARwFrX+6zTr
         d5MLpfvzvG6FqQUOVvJLuJPEgL6/w4+gS1fiPJPRCELTjN+PFIDw4bpOOsDHLNgTPM9B
         5hJCGc3w/MdE9Y+jUgaD9S/S10t2io91if2X9oJFu6Etw7yRa2N5dUkeD837MaTRLguQ
         7dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548175; x=1795152975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Asn5k3wB77QNm+ii4GqJgfJg46vBWMInhGMAcW/l5U0=;
        b=SZ5wy+XWG3vWcGFXXtyw21T5Oh5S6C3BzirafqYGWzUkUX2iowJ699HDaGqMVbDeTI
         3Q/5r9j6cic2VCAutffNbzDwxaC1UR7NT3LSC7zHX0cwOWt5VS501le0lRE3LZ8m5xwd
         r0qAroOqNThtgyWR+ip6gXmawxTeS5iy4gVmqGe86ZbnMv2GvckAEZx86gJOAAooXmpe
         XoH1g5DAi+QGzp8eV8CJ7QkJIP06EWB6yU403KL+DoZK4oaadD+QiO+zKmXovO7p4fAI
         WqIJ9Xv2GNRDLNh7fzSZbvGt7spRgySZv8L7Fb2gzjQpNkozFTpF5vsqFgv9JHOlhjPa
         bR0g==
X-Forwarded-Encrypted: i=1; AL+hErHzPFWPAQ+dH7TiP+YBrsMqQgUGz6TWBuJo2vIsmbFKUWmQ0HiSXQH2W+NW+ZNUw346asuPLDfWl6s=@lists.infradead.org
X-Gm-Message-State: APuU4Z+BiinJ229UTCn66w36RI/eaMnKi3NZqIDDbDvtbZ2Z1R6raegZ
	NIA1S0il2YXhuTNJX/E5jPddaeluqFRHeWEh9Rp5OVZOrUgsrLZ1eEmNZF2T0CMko0sJObffwiy
	OGtWFc7ejJnwF9wzVqFe/8X7nupyOglu5nTBnOWPIZg==
X-Gm-Gg: AYBFou0bbjnjR2iTvm0owW+1hXkxicVFgvnPzp/GCWjv9+tnFeWevajbTEFLCpKlZ+d
	kMvHGtt0HG311RNgxutZnE297aPXsZgOVDgkKdPSUiGfGOHIC2SBRx9KY1VT0f79Z0Kgt6J5VYC
	wl/kfNyvsDSb8mrDC/veSR5yBRGnHtSahPQDMdDsNP837+sBT6OQWJ2LwjMcVNccjVjEDCB8UuE
	lti9yznH/0MPn444jzuc12qLiCj/o4Doe5nliIKXDlDsSzIHyuI11ciBtT5hW5Lq4lmKCyCtVO2
	TGIEr4btWDMkA/rLIG3TOhGfmr0mdTH9bph825Bdz7GJ+4EI+QC8mHjFxJhP3/C8oZEtZWJDKtB
	Dmkr0o9exwGlRc2j3ZTnJrqu0IPuDbD5yBMW6Ajk5rh3WEs3AjqLLBElhxB+0sOlzkJd7HPb1Gx
	UpTN8ign1DNRI0Qa1lvcR++5znWeCs1huUdRcSzDDnwy6WvPdOxT3WGTb6
X-Received: by 2002:a05:600c:8909:b0:4a1:f720:74cd with SMTP id
 5b1f17b1804b1-4bb55a83e95mr22775035e9.24.1794548175140; Thu, 12 Nov 2026
 21:36:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260923091658.1421475-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20260923091658.1421475-1-xiangwencheng@lanxincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:06:03 +0530
X-Gm-Features: AclHuK-hB4uNWUkZ5GD6or_GmOhWyIPCmKZQ4zfjMNF_IuFbt8PDj-n3XQqHnik
Message-ID: <CAAhSdy0Fp5R9v1O7gEoVriBBfnSapTgQ52ZLn5+QJOMxnn1z3w@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Serialize and atomize the IMSIC's TOPEI
 read-and-clear operation
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: xb@ultrarisc.com, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	graf@amazon.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_213617_192338_1B047B1D 
X-CRM114-Status: GOOD (  22.67  )
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

T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMjo0N+KAr1BNIEJpbGxYaWFuZwo8eGlhbmd3ZW5jaGVu
Z0BsYW54aW5jb21wdXRpbmcuY29tPiB3cm90ZToKPgo+IFRoZSBUT1BFSSByZWFkLWFuZC1jbGVh
ciBtdXN0IGJlIGF0b21pYyB3aXRoIHJlc3BlY3QgdG8KPiBpbnRlcnJ1cHQgaW5qZWN0aW9uIChz
ZXRfYml0IGluIEVJUCkuIE90aGVyd2lzZSBhbgo+IGludGVycnVwdCBpbmplY3RlZCBiZXR3ZWVu
IHRoZSB0b3BlaSByZWFkIGFuZCB0aGUKPiBjbGVhcl9iaXQgY291bGQgYmUgc2lsZW50bHkgZHJv
cHBlZC4KPgo+IHYzOgo+ICAtIGZpeCB1bmRlZmluZWQgZWZsYWdzCj4KPiB2MjoKPiAgLSBmaXgg
cGF0Y2ggZmlsZSBjdXJydXB0aW9uCj4KPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3Zt
LXJpc2N2LzIwMjYwOTIzMDcwMzMyLjEzNzYxMzItMS14aWFuZ3dlbmNoZW5nQGxhbnhpbmNvbXB1
dGluZy5jb20vCj4KPiBTaWduZWQtb2ZmLWJ5OiBCaWxsWGlhbmcgPHhpYW5nd2VuY2hlbmdAbGFu
eGluY29tcHV0aW5nLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCA0
MiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IGlu
ZGV4IGMxYWYyM2U3OWFlMC4uYzQ0MDA4ODY1MWVjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL2FpYV9pbXNpYy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBAQCAt
NjA3LDI2ICs2MDcsMjUgQEAgc3RhdGljIHZvaWQgaW1zaWNfdnNmaWxlX2NsZWFudXAoc3RydWN0
IGltc2ljICppbXNpYykKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2FpYV9mcmVlX2hnZWko
b2xkX3ZzZmlsZV9jcHUsIG9sZF92c2ZpbGVfaGdlaSk7Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBp
bXNpY19zd2ZpbGVfZXh0aXJxX3VwZGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3N0YXRp
YyB2b2lkIF9faW1zaWNfc3dmaWxlX2V4dGlycV91cGRhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgaW1zaWMgKmltc2ljID0gdmNwdS0+YXJjaC5haWFfY29u
dGV4dC5pbXNpY19zdGF0ZTsKPiAgICAgICAgIHN0cnVjdCBpbXNpY19tcmlmICptcmlmID0gaW1z
aWMtPnN3ZmlsZTsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gLQo+IC0gICAgICAg
LyoKPiAtICAgICAgICAqIFRoZSBjcml0aWNhbCBzZWN0aW9uIGlzIG5lY2Vzc2FyeSBkdXJpbmcg
ZXh0ZXJuYWwgaW50ZXJydXB0Cj4gLSAgICAgICAgKiB1cGRhdGVzIHRvIGF2b2lkIHRoZSByaXNr
IG9mIGxvc2luZyBpbnRlcnJ1cHRzIGR1ZSB0byBwb3RlbnRpYWwKPiAtICAgICAgICAqIGludGVy
cnVwdGlvbnMgYmV0d2VlbiByZWFkaW5nIHRvcGVpIGFuZCB1cGRhdGluZyBwZW5kaW5nIHN0YXR1
cy4KPiAtICAgICAgICAqLwo+IC0KPiAtICAgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSgmaW1z
aWMtPnN3ZmlsZV9leHRpcnFfbG9jaywgZmxhZ3MpOwo+Cj4gICAgICAgICBpZiAoaW1zaWNfbXJp
Zl9hdG9taWNfcmVhZChtcmlmLCAmbXJpZi0+ZWlkZWxpdmVyeSkgJiYKPiAgICAgICAgICAgICBp
bXNpY19tcmlmX3RvcGVpKG1yaWYsIGltc2ljLT5ucl9laXgsIGltc2ljLT5ucl9tc2lzKSkKPiAg
ICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfc2V0X2ludGVycnVwdCh2Y3B1LCBJUlFfVlNf
RVhUKTsKPiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfdW5z
ZXRfaW50ZXJydXB0KHZjcHUsIElSUV9WU19FWFQpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBp
bXNpY19zd2ZpbGVfZXh0aXJxX3VwZGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiAr
ICAgICAgIHN0cnVjdCBpbXNpYyAqaW1zaWMgPSB2Y3B1LT5hcmNoLmFpYV9jb250ZXh0Lmltc2lj
X3N0YXRlOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPgo+ICsgICAgICAgcmF3X3Nw
aW5fbG9ja19pcnFzYXZlKCZpbXNpYy0+c3dmaWxlX2V4dGlycV9sb2NrLCBmbGFncyk7Cj4gKyAg
ICAgICBfX2ltc2ljX3N3ZmlsZV9leHRpcnFfdXBkYXRlKHZjcHUpOwo+ICAgICAgICAgcmF3X3Nw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmltc2ljLT5zd2ZpbGVfZXh0aXJxX2xvY2ssIGZsYWdzKTsK
PiAgfQo+Cj4gQEAgLTkxMiwxMiArOTExLDE1IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfaW1z
aWNfcm13KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBpc2VsLAo+ICAgICAg
ICAgc3RydWN0IGltc2ljX21yaWZfZWl4ICplaXg7Cj4gICAgICAgICBpbnQgciwgcmMgPSBLVk1f
SU5TTl9DT05USU5VRV9ORVhUX1NFUEM7Cj4gICAgICAgICBzdHJ1Y3QgaW1zaWMgKmltc2ljID0g
dmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNpY19zdGF0ZTsKPiArICAgICAgIHVuc2lnbmVkIGxv
bmcgZmxhZ3M7Cj4KPiAgICAgICAgIC8qIElmIElNU0lDIHZDUFUgc3RhdGUgbm90IGluaXRpYWxp
emVkIHRoZW4gZm9yd2FyZCB0byB1c2VyIHNwYWNlICovCj4gICAgICAgICBpZiAoIWltc2ljKQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gS1ZNX0lOU05fRVhJVF9UT19VU0VSX1NQQUNFOwo+Cj4g
ICAgICAgICBpZiAoaXNlbCA9PSBLVk1fUklTQ1ZfQUlBX0lNU0lDX1RPUEVJKSB7Cj4gKyAgICAg
ICAgICAgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnN3ZmlsZV9leHRpcnFfbG9j
aywgZmxhZ3MpOwo+ICsKPiAgICAgICAgICAgICAgICAgLyogUmVhZCBwZW5kaW5nIGFuZCBlbmFi
bGVkIGludGVycnVwdCB3aXRoIGhpZ2hlc3QgcHJpb3JpdHkgKi8KPiAgICAgICAgICAgICAgICAg
dG9wZWkgPSBpbXNpY19tcmlmX3RvcGVpKGltc2ljLT5zd2ZpbGUsIGltc2ljLT5ucl9laXgsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbXNpYy0+bnJfbXNpcyk7
Cj4gQEAgLTkzNCwxNiArOTM2LDIwIEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfcm13
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBpc2VsLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVpeC0+ZWlwKTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgaWYgKHdy
X21hc2spCj4gKyAgICAgICAgICAgICAgICAgICAgICAgX19pbXNpY19zd2ZpbGVfZXh0aXJxX3Vw
ZGF0ZSh2Y3B1KTsKClRoZSBfX2ltc2ljX3N3ZmlsZV9leHRpcnFfdXBkYXRlKCkgYWxzbyBjYWxs
cyBpbXNpY19tcmlmX3RvcGVpKCkgc28gaXQgaXMKYmV0dGVyIHRvIHBhc3MgdG9wZWkgdmFsdWUg
dG8gX19pbXNpY19zd2ZpbGVfZXh0aXJxX3VwZGF0ZSgpLgoKPiArCj4gKyAgICAgICAgICAgICAg
IHJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZpbXNpYy0+c3dmaWxlX2V4dGlycV9sb2NrLCBm
bGFncyk7Cj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICByID0gaW1zaWNfbXJp
Zl9ybXcoaW1zaWMtPnN3ZmlsZSwgaW1zaWMtPm5yX2VpeCwgaXNlbCwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZhbCwgbmV3X3ZhbCwgd3JfbWFzayk7Cj4gICAgICAgICAg
ICAgICAgIC8qIEZvcndhcmQgdW5rbm93biBJTVNJQyByZWdpc3RlciB0byB1c2VyLXNwYWNlICov
Cj4gICAgICAgICAgICAgICAgIGlmIChyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJjID0g
KHIgPT0gLUVOT0VOVCkgPyAwIDogS1ZNX0lOU05fSUxMRUdBTF9UUkFQOwo+IC0gICAgICAgfQo+
Cj4gLSAgICAgICBpZiAod3JfbWFzaykKPiAtICAgICAgICAgICAgICAgaW1zaWNfc3dmaWxlX2V4
dGlycV91cGRhdGUodmNwdSk7Cj4gKyAgICAgICAgICAgICAgIGlmICh3cl9tYXNrKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGltc2ljX3N3ZmlsZV9leHRpcnFfdXBkYXRlKHZjcHUpOwo+ICsg
ICAgICAgfQo+Cj4gICAgICAgICByZXR1cm4gcmM7Cj4gIH0KPiBAQCAtMTA1MCw5ICsxMDU2LDE3
IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfaW5qZWN0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwKPiAgICAgICAgIGlmIChpbXNpYy0+dnNmaWxlX2NwdSA+PSAwKSB7Cj4gICAgICAgICAg
ICAgICAgIHdyaXRlbChpaWQsIGltc2ljLT52c2ZpbGVfdmEgKyBJTVNJQ19NTUlPX1NFVElQTlVN
X0xFKTsKPiAgICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAg
ICAgICAgICAqIFNlcmlhbGl6ZSB0aGUgRUlQIHNldCArIGV4dGVybmFsLWlycSB1cGRhdGUgYWdh
aW5zdCB0aGUKPiArICAgICAgICAgICAgICAgICogVE9QRUkgcmVhZC1hbmQtY2xlYXIgcGF0aCBz
byB0aGF0IGFuIGluamVjdGVkIGludGVycnVwdAo+ICsgICAgICAgICAgICAgICAgKiBjYW5ub3Qg
YmUgc2lsZW50bHkgbG9zdCB3aGVuIHRoZSBndWVzdCBhY2tub3dsZWRnZXMgYQo+ICsgICAgICAg
ICAgICAgICAgKiBkaWZmZXJlbnQgKG9yIHRoZSBzYW1lKSBpbnRlcnJ1cHQgY29uY3VycmVudGx5
Lgo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgcmF3X3NwaW5fbG9jaygm
aW1zaWMtPnN3ZmlsZV9leHRpcnFfbG9jayk7Cj4gICAgICAgICAgICAgICAgIGVpeCA9ICZpbXNp
Yy0+c3dmaWxlLT5laXhbaWlkIC8gQklUU19QRVJfVFlQRSh1NjQpXTsKPiAgICAgICAgICAgICAg
ICAgc2V0X2JpdChpaWQgJiAoQklUU19QRVJfVFlQRSh1NjQpIC0gMSksIGVpeC0+ZWlwKTsKPiAt
ICAgICAgICAgICAgICAgaW1zaWNfc3dmaWxlX2V4dGlycV91cGRhdGUodmNwdSk7Cj4gKyAgICAg
ICAgICAgICAgIF9faW1zaWNfc3dmaWxlX2V4dGlycV91cGRhdGUodmNwdSk7Cj4gKyAgICAgICAg
ICAgICAgIHJhd19zcGluX3VubG9jaygmaW1zaWMtPnN3ZmlsZV9leHRpcnFfbG9jayk7Cj4gICAg
ICAgICB9Cj4KPiAgICAgICAgIHJlYWRfdW5sb2NrX2lycXJlc3RvcmUoJmltc2ljLT52c2ZpbGVf
bG9jaywgZmxhZ3MpOwo+IC0tCj4gMi41My4wCgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
