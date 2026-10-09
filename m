Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8054BCA601F
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 19:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHJ6AbMSmtkSYqlL/yLR8WpF0Go+rg/vCSMrjgM1OxI=; b=RtSGkHA0agONHb
	LIBxQKHAAmEmcgup26U+oudGRTSqcEeBC5FKEMU6bXBekMhXgNnxyLCBrUW4c/kjg4dlwg0oaGzQx
	wEpcekYSnDrsjwWPVqAMUtEiJ6gD3tVlZaMmvksh3d1i0LCUHRB2Sh3dZ9oGmE2ANIpW/kCR8eUXh
	cIk7z4WbOdcueoAjXicDIU0QTaWCyjE81SwzW78nqhRVNlYxsN4/OIEt3k3zoPcYrgxWzJggiYQZx
	i5TZ4rdtbx8lkePmp/mO70CZimpQ/Q3Oi6MMjIUC2BuMaaBnpNyzwrFpS1M7NFwlBkVFHikwhAiCe
	IWeTTBu2TF3QttcZcbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGCO-000000075e9-2koa;
	Fri, 09 Oct 2026 19:24:08 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGCL-000000075cl-1lbS
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 19:24:07 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3a1981228f8so1672411fa.1
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Oct 2026 12:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791573843; cv=none;
        d=google.com; s=arc-20260327;
        b=EmjNOBO3/HWdMLGUK3AWuKcge24CM1hDylNVuBPQW3JvLcDzfLlppv9Uij2vAr+2LE
         QegtuQWLeppYreRAaesEqfP5FD7v5edWd7MTqnzBLabeWJrqdJ1nE+Zyn5CviubQNf6m
         Xi0/vb9faDlaBlBsf5N/YdZBdFqDI5pGnfWJHbL+tCvD65Y9Q88w31yy9G9km2XQTo8N
         TTPYPiJNWPoTppMU3sQQRBqHzWJULPzf5TIkE24zDz1GgVlInFb5hLgoDFEzZ1dk/BnO
         H1sL2GJYAuyz5sIL92TiPcBoE4r7lZT+svej3mBrj2Sy3GRJR+uEnJxTz+uYZ/2NQ+XE
         afKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=haLy8ZeM+C7vDsculWHcebwwmM/8lN1aLZGFhZL9E0E=;
        fh=hUpZjkgQsPkYdODH022niXzJnXoWBBYJNCoTduosPP4=;
        b=S01GLceusXn4fJ59t41xYZYXHouECscoxcO5n0Z4cZA/sYcFXFVvXwbqi1zwQjG194
         jsfEqhs/xCJFy5Z99mCnTJ1/pbESfak0Z9ST2yOICBq5uI0L7QJk68G36IQ1JxW690xm
         y5BTFIIpW1BEKE4toy6RQ6TQrK9KCBOqKTAEcqjnDt1rlc37vJNYjz8qAXm/0j3D4o0X
         5R1YAmO/VxJiQ+fih6KURC7tVayfF78OZZSAVaAk5wGFdc839BheiaKIPjpqX1vpIcrY
         owekfKLyKhxue0Te84/aPks/NW1NYYOzyskQI7+A3sAydtPVg6EIAt3L4Dmij8P+8pDU
         LZYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791573843; x=1792178643; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=haLy8ZeM+C7vDsculWHcebwwmM/8lN1aLZGFhZL9E0E=;
        b=In66EbFeWW3gN/Zayz/irYmK3EtI8qDC2PdScvG3ZCrjk+xjoCst1yuRqBafz1cBwe
         /PcQ43qzoR4ci1rbc7XqTOYQ4pGDT0VB4Sb8f+2cglGL3gnwgSxJoYM81rms2IEzch92
         ysltJMbonCXl4agsaneoXIFLejYLcFe3cUp5ix+zFXKm/I7kBbN6QzyuoGoKyJ0ow3SW
         S4xLwRyCDZxdtWmUBVIuUP3+irV2wU06x99e0HZsKK+UMuB36XZr6bAeeTf7/VBmdLLW
         qZ9DschplzIonTLEzD5y2z/pr0Ac7zK5bR3AMTZ6YMYtFtGpeYAPaKblbF6JALBuQMQr
         NBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791573843; x=1792178643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haLy8ZeM+C7vDsculWHcebwwmM/8lN1aLZGFhZL9E0E=;
        b=UXclz/gRC7i1foz9k9ga+KtNrMdk8QRNjBmHnvfurWrFDBmNij7QSakLDghehCBfgj
         S00T3IqSaAbIAFdTT7tgRNA41Qd5/VzKVyxOaRmnpul2FBswPBWnTEm5KI0BKmKmP+68
         JaUTTaGBOwY2ggSrK1zwg0SgiXHoXNlnlSU1VPJWjDqnzEQIiwyVUgOu1cDMm6kA2PM/
         qo7jkbM1MUoXxY9W4Dl6lChvxkIwl2vKZCkzG0f5FDwFqnwCsnZWT7rJrl+PlgDUthnJ
         JKZ4yl4iQ2nLeIZ1HRFRqgB5UZ+pFaXWm71IuAMkEN1DEYi4vbwvK8LTcM1PCn+7M1YG
         KFRQ==
X-Forwarded-Encrypted: i=1; AKwUvBysiLj51TRp9l3yaqgs6wqS1hcRSahdn5fD2XMDlA3qqRkqjB8oZEv/wMjDRsLe7q+bl5m3/aQR0p4=@lists.infradead.org
X-Gm-Message-State: AFq9FYLBEESjLSDUGgJBVtz6DpNucG/Z5pSUDB3GCsIo7yqv7lx38FSY
	VRM/+ptd57sNLSKIvAfwfGMjmMZcJQYzT610wdIT3KmJkwOjz596ZzzbJIO+9FEK2utPioFIh3j
	RLgeFDQoTqQURTfDbJfHCR58rwLgCtYfbbwRAqERJ8w==
X-Gm-Gg: AYBFou2kzPQ80+xXVJ48b/L7rU/O/a7peM8y94CEOb5Gytd0vHA30NEuOIzaTbNN+yj
	SXdQCgMdWdzfSaZAX7i4njI9NlJXtFVJ+gStbqooH9RNqiJZsRMBUsrR6+7cjNgjWOakyH9g3gT
	5E/gL0VqJ3BMwmpSkzp0BvwY3ZNyy+zS6TkAulo1OcfNN3t1O0pLJitY/Bzt9PH0AsoGZ8j/gqA
	N7RUW/ArSSRjxVmUclHTgbxui2q4wLTSjqVs5652q1kSHOlRLEJTt4zGS661ZJjiKzTioip6EA0
	SNoI/uUifryw3OP7QqvzHFfh0AqvX4ghtSEVkLerKDiwTw+Z7Ejpln9q70B8nAPgayAjN2z8Lak
	vgDjDy4sYXzDXJ6jyLRZUQtqwDtSgGXkOOZ9YS6qXDwCJqP9xc60q5XGNpVysujZDFh5btTUm4A
	==
X-Received: by 2002:a05:651c:1507:b0:3a9:85b7:e9a6 with SMTP id
 38308e7fff4ca-3a9c55c402fmr7437811fa.18.1791573843030; Fri, 09 Oct 2026
 12:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260827211209.2871124-1-dave@stgolabs.net>
In-Reply-To: <20260827211209.2871124-1-dave@stgolabs.net>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 21:23:51 +0200
X-Gm-Features: AclHuK8pYw9CkZxWgfGt52ATvUy7aaPiiz-as0EpJ_Axx2N81w7TbtNqXoxKQWE
Message-ID: <CAAhSdy1OUpQUFtQ0Cp0BgSqnxHYUnnCZ0wVsDKz4S57YUa+1cA@mail.gmail.com>
Subject: Re: [PATCH] riscv/kvm: Only context-switch senvcfg where it exists
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_122406_147289_70D0967D 
X-CRM114-Status: GOOD (  16.67  )
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

T24gVGh1LCBBdWcgMjcsIDIwMjYgYXQgMTE6MTLigK9QTSBEYXZpZGxvaHIgQnVlc28gPGRhdmVA
c3Rnb2xhYnMubmV0PiB3cm90ZToKPgo+IHNlbnZjZmcgYXJyaXZlZCBpbiBwcml2aWxlZ2VkIHNw
ZWMgMS4xMiwgYnV0IEgtY2FwYWJsZSBjb3JlcyBvbiBhCj4gMS4xMSBiYXNlIGV4aXN0LCBpZTog
c2lmaXZlIFA1MDAgKEVTV0lOIEVJQzc3MDBYKSBpbXBsZW1lbnRzIHRoZQo+IGh5cGVydmlzb3Ig
ZXh0ZW5zaW9uIHlldCBoYXMgbm8gc2VudmNmZy4gS1ZNIHN3YXBzIHRoZSBDU1IKPiB1bmNvbmRp
dGlvbmFsbHkgb24gZXZlcnkgdkNQVSBlbnRyeSwgcGFuaWNpbmcgdGhlIGhvc3QgdXBvbiBhIGd1
ZXN0Cj4gZXhlY3V0aW5nIGl0cyBmaXJzdCBpbnN0cnVjdGlvbjoKPgo+ICAgT29wcyAtIGlsbGVn
YWwgaW5zdHJ1Y3Rpb24gWyMxXQo+ICAgTW9kdWxlcyBsaW5rZWQgaW46IGt2bQo+ICAgQ1BVOiAy
IFVJRDogMCBQSUQ6IDEyNyBDb21tOiBxZW11LXN5c3RlbS1yaXMgTm90IHRhaW50ZWQgNy4yLjAt
a3ZtNzNidWcrICM0IFBSRUVNUFRMQVpZCj4gICBIYXJkd2FyZSBuYW1lOiBVbmtub3duIFVua25v
d24gUHJvZHVjdC9Vbmtub3duIFByb2R1Y3QsIEJJT1MgMjAyNC4wMSAwMS8wMS8yMDI0Cj4gICBl
cGMgOiBrdm1fcmlzY3ZfdmNwdV9lbnRlcl9leGl0KzB4MjYvMHhjZjggW2t2bV0KPiAgICByYSA6
IGt2bV9hcmNoX3ZjcHVfaW9jdGxfcnVuKzB4NGNlLzB4NWE2IFtrdm1dCj4gICBzdGF0dXM6IDAw
MDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAwMDAxMGE3OTdmMyBjYXVzZTogMDAwMDAwMDAw
MDAwMDAwMgo+ICAgWzxmZmZmZmZmZjAxZGY0MzJlPl0ga3ZtX3Jpc2N2X3ZjcHVfZW50ZXJfZXhp
dCsweDI2LzB4Y2Y4IFtrdm1dCj4gICBbPGZmZmZmZmZmMDFkZWIzYjA+XSBrdm1fYXJjaF92Y3B1
X2lvY3RsX3J1bisweDRjZS8weDVhNiBba3ZtXQo+ICAgWzxmZmZmZmZmZjAxZGQ3OTE0Pl0ga3Zt
X3ZjcHVfaW9jdGwrMHgxODAvMHg1ZTQgW2t2bV0KPiAgIFs8ZmZmZmZmZmY4MDI1NzAyZT5dIF9f
cmlzY3Zfc3lzX2lvY3RsKzB4ODQvMHg5YQo+ICAgWzxmZmZmZmZmZjgwZGZkYzcyPl0gZG9fdHJh
cF9lY2FsbF91KzB4MWQ4LzB4MzhhCj4gICBbPGZmZmZmZmZmODBlMDg2NDQ+XSBoYW5kbGVfZXhj
ZXB0aW9uKzB4MTY4LzB4MTc0Cj4gICBDb2RlOiA4NGFhIDg5MmUgYjcwMyA4ODg3IDE3NzMgMTA2
NyAzMDIzIDE2ZTUgYjc4MyA4OTA3ICg5N2YzKSAxMGE3Cj4KPiBUb3VjaCB0aGUgQ1NSIG9ubHkg
d2hlbiBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRyBpcyBzZXQsIHNpbWlsYXIKPiB0byBfX3N3
aXRjaF90b19lbnZjZmcoKSBhcyB3ZWxsIGFzIG90aGVyIHN3YXBzIGNvbmRpdGlvbmFsIG9uCj4g
dGhlaXIgZXh0ZW50aW9ucy4KPgo+IEZpeGVzOiBkYjNjMDFjN2EzMDggKCJSSVNDVjogS1ZNOiBB
ZGQgc2VudmNmZyBjb250ZXh0IHNhdmUvcmVzdG9yZSIpCj4gU2lnbmVkLW9mZi1ieTogRGF2aWRs
b2hyIEJ1ZXNvIDxkYXZlQHN0Z29sYWJzLm5ldD4KCllvdXIgcGF0Y2ggaXMgb25seSBjaGVja2lu
ZyBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRyB3aGVuCnNhdmluZy9yZXN0b3Jpbmcgc2VudmNm
ZyBidXQgbm90IGNoZWNraW5nIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHCndoZW4gYWNjZXNz
aW5nIGhlbnZjZmcuIFRoaXMgdGVsbHMgbWUgdGhhdCBQNTAwIHNvbWVob3cgbWFuYWdlcyB0bwpp
bXBsZW1lbnQgaGVudmNmZyBidXQgZm9yZ290IHRvIGltcGxlbWVudCBzZW52Y2ZnLiBDbGVhcmx5
LCBjaGVja2luZwpSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRyBpcyBub3QgdGhlIHJpZ2h0IGFw
cHJvYWNoLgoKSW5zdGVhZCwgSSBzdWdnZXN0IGludHJvZHVjaW5nIHN0YXRpYy1rZXkga3ZtX3Jp
c2N2X25vX3NlbnZjZmcgYW5kIHNldAppdCBvbmx5IGZvciBQNTAwIChFU1dJTiBFSUM3NzAwWCkg
aW4ga3ZtX3Jpc2N2X3NldHVwX3ZlbmRvcl9mZWF0dXJlcygpLgpBbHNvLCBkb24ndCBzYXZlL3Jl
c3RvcmUgc2VudmNmZyBDU1Igb25seSB3aGVuIGt2bV9yaXNjdl9ub19zZW52Y2ZnIGlzCnNldC4K
ClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDYgKysrKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5j
Cj4gaW5kZXggZTA2MmNhMTlmOWQ4Li4wYzJkNThkYjEzYWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTc3Myw3
ICs3NzMsOCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc3dh
cF9pbl9ndWVzdF9zdGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKgo+ICAgICAgICAgc3RydWN0IGt2bV92
Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOwo+Cj4gICAgICAgICB2Y3B1LT5h
cmNoLmhvc3Rfc2NvdW50ZXJlbiA9IGNzcl9zd2FwKENTUl9TQ09VTlRFUkVOLCBjc3ItPnNjb3Vu
dGVyZW4pOwo+IC0gICAgICAgdmNwdS0+YXJjaC5ob3N0X3NlbnZjZmcgPSBjc3Jfc3dhcChDU1Jf
U0VOVkNGRywgY3NyLT5zZW52Y2ZnKTsKPiArICAgICAgIGlmIChyaXNjdl9oYXNfZXh0ZW5zaW9u
X3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHKSkKPiArICAgICAgICAgICAgICAg
dmNwdS0+YXJjaC5ob3N0X3NlbnZjZmcgPSBjc3Jfc3dhcChDU1JfU0VOVkNGRywgY3NyLT5zZW52
Y2ZnKTsKPiAgICAgICAgIGlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lT
QV9FWFRfU01TVEFURUVOKSkKPiAgICAgICAgICAgICAgICAgdmNwdS0+YXJjaC5ob3N0X3NzdGF0
ZWVuMCA9IGNzcl9zd2FwKENTUl9TU1RBVEVFTjAsIHNtY3NyLT5zc3RhdGVlbjApOwo+ICAgICAg
ICAgaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9aSUNGSVNT
KSkKPiBAQCAtNzg3LDcgKzc4OCw4IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBrdm1f
cmlzY3ZfdmNwdV9zd2FwX2luX2hvc3Rfc3RhdGUoc3RydWN0IGt2bV92Y3B1ICp2Cj4gICAgICAg
ICBzdHJ1Y3Qga3ZtX3ZjcHVfY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5ndWVzdF9jc3I7Cj4KPiAg
ICAgICAgIGNzci0+c2NvdW50ZXJlbiA9IGNzcl9zd2FwKENTUl9TQ09VTlRFUkVOLCB2Y3B1LT5h
cmNoLmhvc3Rfc2NvdW50ZXJlbik7Cj4gLSAgICAgICBjc3ItPnNlbnZjZmcgPSBjc3Jfc3dhcChD
U1JfU0VOVkNGRywgdmNwdS0+YXJjaC5ob3N0X3NlbnZjZmcpOwo+ICsgICAgICAgaWYgKHJpc2N2
X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcpKQo+ICsg
ICAgICAgICAgICAgICBjc3ItPnNlbnZjZmcgPSBjc3Jfc3dhcChDU1JfU0VOVkNGRywgdmNwdS0+
YXJjaC5ob3N0X3NlbnZjZmcpOwo+ICAgICAgICAgaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5s
aWtlbHkoUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pKQo+ICAgICAgICAgICAgICAgICBzbWNzci0+
c3N0YXRlZW4wID0gY3NyX3N3YXAoQ1NSX1NTVEFURUVOMCwgdmNwdS0+YXJjaC5ob3N0X3NzdGF0
ZWVuMCk7Cj4gICAgICAgICBpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9J
U0FfRVhUX1pJQ0ZJU1MpKQo+IC0tCj4gMi4zOS41Cj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
