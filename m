From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 12 Dec 2023 14:38:02 +0100
Subject: [PATCH v2 1/2] KVM: Use syscore_ops instead of reboot_notifier to
 hook restart/shutdown
In-Reply-To: <cf9e15bf3da411ada1c5b2bbdbfdea836029a5e1.camel@amazon.com>
References: <20230512233127.804012-1-seanjc@google.com> <20230512233127.804012-2-seanjc@google.com>
 <cfed942fc767fa7b2fabc68a3357a7b95bd6a589.camel@amazon.com>
 <871qbud5f9.fsf@email.froward.int.ebiederm.org> <a02b40d3d9ae5b3037b9a9d5921cfb0144ab5610.camel@amazon.com>
 <7e30cfc2359dfef39d038e3734f7e5e3d9e82d68.camel@amazon.com>
 <87wmtk9u46.fsf@email.froward.int.ebiederm.org> <cf9e15bf3da411ada1c5b2bbdbfdea836029a5e1.camel@amazon.com>
Message-ID: <CABgObfZKOkUn3++g-YMkv7bsmKU77Y88NPBqt-5XoRJFLXDEFA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 12, 2023 at 9:51?AM Gowans, James <jgowans@amazon.com> wrote:
> 1. Does hardware_disable_nolock actually need to be done on *every* CPU
> or would the offlined ones be fine to ignore because they will be reset
> and the VMXE bit will be cleared that way? With cooperative CPU handover
> we probably do indeed want to do this on every CPU and not depend on
> resetting.

Offlined and onlined CPUs are handled via the CPU hotplug state machine,
which calls into kvm_online_cpu and kvm_offline_cpu.

Paolo


